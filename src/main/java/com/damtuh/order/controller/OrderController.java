package com.damtuh.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.damtuh.order.vo.OrderDetailVO;
import com.damtuh.order.vo.OrderVO;

public interface OrderController {
	public ModelAndView orderPage(OrderDetailVO orderDetailVO, @RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ModelAndView orderConfirm(OrderVO orderVO, OrderDetailVO orderDetailVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
