package com.damtuh.chaStory.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.damtuh.company.controller.CompanyController;

import lombok.extern.log4j.Log4j;

@Controller("chaStoryController")
@EnableAspectJAutoProxy
@Log4j
@RequestMapping("/chaStory/*")
public class ChaStoryController {

	@RequestMapping(value= "/kind.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String kind(Locale locale, Model model) throws Exception{
		return "chaStory/kind";
	}
	
	@RequestMapping(value= "/origin.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String origin(Locale locale, Model model) throws Exception{
		return "chaStory/origin";
	}

}

