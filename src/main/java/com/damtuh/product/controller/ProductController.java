package com.damtuh.product.controller;

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

import lombok.extern.log4j.Log4j;

@Controller("productController")
@RequestMapping("/product/*")
@Log4j
@EnableAspectJAutoProxy
public class ProductController {

	@RequestMapping(value= "/productList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String damtuh(Locale locale, Model model) throws Exception{
		return "product/productList";
	}
	
}