package com.damtuh.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("companyController")
@RequestMapping("/company/*")
public class CompanyControllerImpl implements CompanyController {

	@RequestMapping(value = "/damtuh", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView damtuh(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/history", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/ci", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView ci(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/ideology", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView ideology(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

}
