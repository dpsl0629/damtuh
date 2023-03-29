package com.damtuh.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller("CompanyController")
@RequestMapping("/damtuh/company/*")
public class CompanyController {

	@RequestMapping(value = "/ci.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String kind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/damtuh/company/ci";
	}

	@RequestMapping(value = "/damtuh.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String damtuh(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/damtuh/company/damtuh";
	}

	@RequestMapping(value = "/ideology.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String origin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/damtuh/company/ideology";
	}

	@RequestMapping(value = "/history.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String history(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/damtuh/company/history";
	}

}
