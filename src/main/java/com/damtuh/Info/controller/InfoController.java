package com.damtuh.Info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("infoController")
@RequestMapping("/damtuh/info/*")
public class InfoController {

	@RequestMapping(value = "/kind.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String kind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/damtuh/info/kind";
	}

	@RequestMapping(value = "/origin.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String origin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/info/origin";
	}

}
