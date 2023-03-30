package com.damtuh.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller("CompanyController")
@RequestMapping("/damtuh/company/*")
public class CompanyController {

	@RequestMapping(value = "/ci.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String kind(Model model) throws Exception {
		model.addAttribute("title", "ci");
		return "/damtuh/company/ci";
	}

	@RequestMapping(value = "/damtuh.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String damtuh(Model model) throws Exception {
		model.addAttribute("title", "인사말");
		return "/damtuh/company/damtuh";
	}

	@RequestMapping(value = "/ideology.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String origin(Model model) throws Exception {
		model.addAttribute("title", "경영이념");
		return "/damtuh/company/ideology";
	}

	@RequestMapping(value = "/history.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String history(Model model) throws Exception {
		model.addAttribute("title", "회사연혁");
		return "/damtuh/company/history";
	}

}
