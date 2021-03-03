package com.damtuh.support.notice.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.damtuh.support.notice.dao.SupportDAO;
import com.damtuh.support.notice.service.NoticeBoardService;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;
import com.damtuh.support.notice.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller("supportController")
@Log4j
@RequestMapping("/support/*")
@AllArgsConstructor
public class SupportController {
	
	private NoticeBoardService service;
	private NoticeBoardVO noticeBoardVO;
	private SupportDAO dao;

	@RequestMapping(value= "/notice" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List noticeList = service.getList(cri);
		int total = service.getTotal(cri);
		mav.addObject("list", noticeList);
		mav.addObject("pageMaker", new PageDTO(cri, total));
		return mav;
	}
	
	@RequestMapping(value= "/noticeView" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView noticeView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		noticeBoardVO = service.get(bno);
		mav.setViewName(viewName);
		mav.addObject("article", noticeBoardVO);
		return mav;
	}
	

}