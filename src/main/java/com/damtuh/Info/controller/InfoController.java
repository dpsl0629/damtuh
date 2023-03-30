package com.damtuh.Info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("infoController")
@RequestMapping("/damtuh/info/*")
public class InfoController {

	@RequestMapping(value = "/kind.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String kind(Model model) throws Exception {
		model.addAttribute("title", "차의 종류");
		model.addAttribute("bg", "bg1");
		return "/damtuh/info/kind";
	}

	@RequestMapping(value = "/origin.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String origin(Model model) throws Exception {
		model.addAttribute("title", "차의 기원");
		model.addAttribute("bg", "bg1");
		return "/info/origin";
	}

}
