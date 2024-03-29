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

import com.damtuh.support.notice.service.BoardService;
import com.damtuh.support.notice.vo.AttachFileDTO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;
import com.damtuh.support.notice.vo.PageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller("supportController")
@RequestMapping("/damtuh/support/*")
@Log4j
@RequiredArgsConstructor
public class SupportController {

	private final BoardService boardService;

	@RequestMapping(value = "/noticeList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String notice(Criteria cri, Model model) throws Exception {
		List<NoticeBoardVO> noticeList = boardService.getList(cri);
		int total = boardService.getTotal(cri);
		model.addAttribute("list", noticeList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("title", "담터소식");
		return "/damtuh/support/noticeList";
	}

	@RequestMapping(value = "/noticeView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletResponse response, @ModelAttribute("noticeBoardVO") NoticeBoardVO noticeBoardVO, Model model) throws Exception {
		response.setHeader("pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "No-store");
		response.setDateHeader("Expires", 1L);
		noticeBoardVO = boardService.get(bno);
		List<AttachFileDTO> attachList = boardService.findByBno(bno);
		log.info(attachList);
		model.addAttribute("article", noticeBoardVO);
		model.addAttribute("attachList", attachList);
		model.addAttribute("title", "담터소식");
		return "/damtuh/support/noticeView";
	}

	@RequestMapping(value = "/noticeWrite.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeWrite(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("noticeWrite");
		model.addAttribute("title", "담터소식");
		return "/damtuh/support/noticeWrite";
	}

	@PostMapping(value = "/noticeConfirm.do")
	public String noticeConfirm(NoticeBoardVO vo, Model model) throws Exception {
		log.info(vo);
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(vo.getBno());
		boardService.insert(vo);
		model.addAttribute("title", "담터소식");
		return "redirect:/support/noticeList";
	}

	@RequestMapping(value = "/modifyWrite.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyWrite(@ModelAttribute("cri") Criteria cri, @RequestParam("bno") Long bno, Model model, @ModelAttribute("noticeBoardVO") NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardVO = boardService.get(bno);
		model.addAttribute("notice", noticeBoardVO);
		model.addAttribute("cri", cri);
		model.addAttribute("title", "담터소식");
		return "/damtuh/support/modifyWrite";
	}

	@RequestMapping(value = "/modifyConfirm.do")
	public String modifyConfirm(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") NoticeBoardVO vo,
			RedirectAttributes rttr, Model model) throws Exception {
		log.info(vo);
		boardService.deleteAttach(vo.getBno());
		boolean modifyResult = boardService.updateNotice(vo) == 1;
		boardService.updateAttachNone(vo.getBno());

		if (modifyResult && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setBno(vo.getBno());
				boardService.insertAttach(attach);
				boardService.updateAttachFile(vo.getBno());
			});
		}
		log.info("cri " + cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		model.addAttribute("title", "담터소식");
		return "redirect:/damtuh/support/noticeList";
	}

	@GetMapping(value = "/deleteConfirm.do")
	public String deleteConfirm(@RequestParam("bno") Long bno, Model model) throws Exception {
		boardService.deleteNotice(bno);
		model.addAttribute("title", "담터소식");
		return "redirect:/damtuh/support/noticeList";
	}

	@PostMapping(value = "/upload.do")
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

	@ResponseBody
	@GetMapping("/display.do")
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

	@GetMapping(value = "/download.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
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

	@ResponseBody
	@PostMapping("/deleteFile.do")
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