package com.damtuh.support.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damtuh.support.notice.service.NoticeBoardService;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;
import com.damtuh.support.notice.vo.PageDTO;
import lombok.extern.log4j.Log4j;


@Controller("supportController")
@RequestMapping("/support/*")
@Log4j
public class SupportControllerImpl implements SupportController {
	
	@Autowired
	private NoticeBoardService service;
	
	@Autowired
	private NoticeBoardVO noticeBoardVO;

	@Override
	@RequestMapping(value= "/notice" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<NoticeBoardVO> noticeList = service.getList(cri);
		int total = service.getTotal(cri);
		mav.addObject("list", noticeList);            
		mav.addObject("pageMaker", new PageDTO(cri, total));
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/noticeView" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView noticeView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		response.setHeader("pragma","No-cache");
		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Cache-Control","No-store");
		response.setDateHeader("Expires",1L);
		noticeBoardVO = service.get(bno);
		mav.setViewName(viewName);
		mav.addObject("article", noticeBoardVO);
		return mav;
	}

	@Override
	@RequestMapping(value= "/noticeWrite" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView noticeWrite(@ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("noticeWrite");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@PostMapping(value= "/noticeConfirm")
	public String noticeConfirm(@ModelAttribute("vo") NoticeBoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info(vo);
		service.insert(vo);
		return "redirect:/support/notice";
	}

	@Override
	@RequestMapping(value="/modifyWrite", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView modifyWrite(@ModelAttribute("cri") Criteria cri, @RequestParam("bno") Long bno,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeBoardVO = service.get(bno);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("notice", noticeBoardVO);
		mav.addObject("cri", cri);
		return mav;
	}

	@Override
	@GetMapping(value="/modifyConfirm")
	public String modifyConfirm(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") NoticeBoardVO vo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		log.info(vo);
		service.updateNotice(vo);
		log.info("cri " + cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/support/notice";
	}

	@Override
	@GetMapping(value="/deleteConfirm")
	public String deleteConfirm(@RequestParam("bno") Long bno, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		service.deleteNotice(bno);
		return "redirect:/support/notice";
	}

	@Override
	@PostMapping(value="/upload")
	public void upload(MultipartFile[] uploadFile) throws Exception {
		log.info("uploadAjax");
		
		String uploadFolder = "C:\\upload";
		
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile ) {
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only File Name " + uploadFileName);
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}

	
	

}