package com.damtuh.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {
	public ModelAndView orderPage(@RequestParam("productId") int productId, @RequestParam("totalPrice") String totalPrice, @RequestParam("quantity") int quantity, @RequestParam("productName") String productName, @RequestParam("productPrice") String productPrice,   @RequestParam("productImage") String productImage,  @RequestParam("delivery") int delivery, @RequestParam("point") int point, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
