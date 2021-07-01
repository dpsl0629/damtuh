package com.damtuh.support.notice.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damtuh.support.notice.service.NoticeBoardService;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;
import com.damtuh.support.notice.vo.PageDTO;
import lombok.AllArgsConstructor;
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
		noticeBoardVO = service.get(bno);
		mav.setViewName(viewName);
		mav.addObject("article", noticeBoardVO);
		return mav;
	}

	@Override
	@RequestMapping(value= "/noticeWrite" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView noticeWrite(@ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@PostMapping(value= "/noticeConfirm")
	public String noticeConfirm(@ModelAttribute("vo") NoticeBoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String content = request.getParameter("content");
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

	
	

}