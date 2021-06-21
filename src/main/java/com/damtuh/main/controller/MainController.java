package com.damtuh.main.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainController")
public interface MainController {
	
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}