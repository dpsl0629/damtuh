package com.damtuh.support.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

@Controller("supportController")
@RequestMapping("/support/*")
public interface SupportController {
	
	public ModelAndView notice(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String noticeConfirm(NoticeBoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modifyWrite(@RequestParam("bno") Long bno,HttpServletRequest request, HttpServletResponse response) throws Exception;
}