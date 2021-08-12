package com.damtuh.common.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller("CommonController")
@Log4j
@EnableAspectJAutoProxy
public class CommonControllerImpl implements CommonController {

//	@RequestMapping(value= "/login" ,method={RequestMethod.POST,RequestMethod.GET})
//	public String loginGET(HttpServletRequest request, HttpServletResponse response) {
//		RequestCache requestCache = new HttpSessionRequestCache();
//		SavedRequest savedRequest = requestCache.getRequest(request, response); 
//		
//		try {
//			request.getSession().setAttribute("prevPage", savedRequest.getRedirectUrl());
//		} catch(NullPointerException e) {
//			request.getSession().setAttribute("prevPage", "/");
//		}
//		return "login";
//	}
//	
//	@RequestMapping(value= "/logout" ,method={RequestMethod.POST,RequestMethod.GET})
//	public void logout(Locale locale, Model model) throws Exception{
//		log.info("로그아웃");
//	}
//	
//	@GetMapping("/accessError")
//	public void accessDenied(Authentication auth, Model model) {
//		log.info("access Denied : " + auth);
//	}

}
