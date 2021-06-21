package com.damtuh.Info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("chaStoryController")
@EnableAspectJAutoProxy
@RequestMapping("/chaStory/*")
public interface InfoController {

	public ModelAndView kind(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView origin(HttpServletRequest request, HttpServletResponse response) throws Exception;

}

