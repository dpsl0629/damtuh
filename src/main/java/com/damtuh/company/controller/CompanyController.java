package com.damtuh.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("companyController")
@EnableAspectJAutoProxy
@RequestMapping("/company/*")
public interface CompanyController {

	public ModelAndView damtuh(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView history(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView ci(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView ideology(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
