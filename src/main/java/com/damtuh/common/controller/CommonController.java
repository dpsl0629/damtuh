package com.damtuh.common.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller("CommonController")
@EnableAspectJAutoProxy
public interface CommonController {

	public String loginGET(HttpServletRequest request, HttpServletResponse response);
	
	public void logout(Locale locale, Model model) throws Exception;
	
	public void accessDenied(Authentication auth, Model model);
}
