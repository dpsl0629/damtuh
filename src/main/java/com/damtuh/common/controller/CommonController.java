package com.damtuh.common.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damtuh.member.controller.MemberController;

import lombok.extern.log4j.Log4j;

@Controller("CommonController")
@Log4j
@EnableAspectJAutoProxy
public class CommonController {


	@RequestMapping(value= "/login" ,method={RequestMethod.POST,RequestMethod.GET})
	public String loginGET(HttpServletRequest request, HttpServletResponse response) {
		log.info("ddd");
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response); 
		
		try {
			request.getSession().setAttribute("prevPage", savedRequest.getRedirectUrl());
		} catch(NullPointerException e) {
			request.getSession().setAttribute("prevPage", "/");
		}
		return "login";
	}
	
	@RequestMapping(value= "/logout" ,method={RequestMethod.POST,RequestMethod.GET})
	public void logout(Locale locale, Model model) throws Exception{
		log.info("로그아웃");
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
	}
}
