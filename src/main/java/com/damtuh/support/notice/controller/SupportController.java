package com.damtuh.support.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damtuh.support.notice.service.SupportService;
import com.damtuh.support.notice.vo.AttachFileDTO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;
import com.damtuh.support.notice.vo.PageDTO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller("supportController")
@RequestMapping("/support/*")
@Log4j
public class SupportController {

	@Autowired
	private SupportService service;

	@Autowired
	private NoticeBoardVO noticeBoardVO;

	@RequestMapping(value = "/noticeList", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView notice(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<NoticeBoardVO> noticeList = service.getList(cri);
		int total = service.getTotal(cri);
		mav.addObject("list", noticeList);
		mav.addObject("pageMaker", new PageDTO(cri, total));
		return mav;
	}

	@RequestMapping(value = "/noticeView", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		response.setHeader("pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "No-store");
		response.setDateHeader("Expires", 1L);
		noticeBoardVO = service.get(bno);
		List<AttachFileDTO> attachList = service.findByBno(bno);
		log.info(attachList);
		mav.setViewName(viewName);
		mav.addObject("article", noticeBoardVO);
		mav.addObject("attachList", attachList);
		return mav;
	}

	@RequestMapping(value = "/noticeWrite", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeWrite(@ModelAttribute("cri") Criteria cri, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("noticeWrite");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@PostMapping(value = "/noticeConfirm")
	public String noticeConfirm(NoticeBoardVO vo, RedirectAttributes rttr) throws Exception {
		log.info(vo);
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(vo.getBno());
		service.insert(vo);
		return "redirect:/support/noticeList";
	}

	@RequestMapping(value = "/modifyWrite", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView modifyWrite(@ModelAttribute("cri") Criteria cri, @RequestParam("bno") Long bno,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeBoardVO = service.get(bno);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("notice", noticeBoardVO);
		mav.addObject("cri", cri);
		return mav;
	}

	@GetMapping(value = "/modifyConfirm")
	public String modifyConfirm(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") NoticeBoardVO vo,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		log.info(vo);
		service.deleteAttach(vo.getBno());
		boolean modifyResult = service.updateNotice(vo) == 1;
		service.updateAttachNone(vo.getBno());

		if (modifyResult && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setBno(vo.getBno());
				service.insertAttach(attach);
				service.updateAttachFile(vo.getBno());
			});
		}
		log.info("cri " + cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/support/noticeList";
	}

	@GetMapping(value = "/deleteConfirm")
	public String deleteConfirm(@RequestParam("bno") Long bno, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr) throws Exception {
		service.deleteNotice(bno);
		return "redirect:/support/noticeList";
	}

	@PostMapping(value = "/upload")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> upload(MultipartFile[] uploadFile) throws Exception {
		log.info("uploadAjax");

		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("uploadPath : " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only File Name " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(attachDTO);

			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName : " + fileName);

		File file = new File("c:\\upload\\" + fileName);

		log.info("file : " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		log.info("download file : " + fileName);

		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();

		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

		HttpHeaders headers = new HttpHeaders();

		try {
			String downloadName = null;

			if (userAgent.contains("Trident")) {
				log.info("IE");

				downloadName = URLEncoder.encode(resourceOriginalName, "utf-8").replaceAll("\\+", " ");
			} else if (userAgent.contains("Edge")) {
				log.info("edge");

				downloadName = URLEncoder.encode(resourceOriginalName, "utf-8");

			} else {
				log.info("chrome");

				downloadName = new String(resourceOriginalName.getBytes("utf-8"), "ISO-8859-1");
			}
			headers.add("Content-Disposition",
					"attachment; filename=" + new String(resourceOriginalName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile : " + fileName);

		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));

			file.delete();

			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName : " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}