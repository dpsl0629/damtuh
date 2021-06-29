package com.damtuh.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("productController")
@EnableAspectJAutoProxy
public interface ProductController {

	public ModelAndView productList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView productDetail(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public @ResponseBody String likeCheck(@RequestParam(required = false, value = "cnt") int cnt, @RequestParam(required = false, value = "productId") int productId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}