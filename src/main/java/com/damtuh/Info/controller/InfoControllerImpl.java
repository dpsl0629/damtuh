package com.damtuh.Info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("infoController")
@EnableAspectJAutoProxy
@RequestMapping("/info/*")
public class InfoControllerImpl implements InfoController {

	@RequestMapping(value = "/kind", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView kind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/origin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView origin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

}
