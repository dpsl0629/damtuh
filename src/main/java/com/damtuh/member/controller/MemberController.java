package com.damtuh.member.controller;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
<<<<<<< HEAD

import com.damtuh.member.vo.CommentVO;
=======
>>>>>>> 9171caaede43bca28dce6d3fa4d511e24ad137e7
import com.damtuh.member.vo.MemberVO;

@Controller("memberController")
@EnableAspectJAutoProxy
@RequestMapping("/member/*")
public interface MemberController {

	public String loginPage(HttpServletRequest request, HttpServletResponse response, Model model, Authentication authentication) throws Exception; 

	public String join(Locale locale, Model model) throws Exception;
	
	public @ResponseBody String memberIdChkPOST(@RequestParam(required = false, value = "memberId") String memberId) throws Exception;
	
    public String mailCheckGET(String email) throws Exception;
    	
	public ModelAndView joinConfirm(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws Exception;
	
	public String modifyCheck(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modifyCheckForm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	
	public String memberModify(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	
	public ModelAndView modifyConfirm(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String deleteConfirm(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception;
	
	public ModelAndView productCommentForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
<<<<<<< HEAD
	public ModelAndView commentConfirm(CommentVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
=======
	public ModelAndView commentConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception;
>>>>>>> 9171caaede43bca28dce6d3fa4d511e24ad137e7

	public ModelAndView productCommentConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception;

}