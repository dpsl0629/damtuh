package com.damtuh.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.damtuh.member.service.MemberService;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.order.service.OrderService;
import com.damtuh.order.vo.OrderDetailVO;
import com.damtuh.order.vo.OrderVO;
import com.damtuh.product.service.ProductService;
import com.damtuh.product.vo.ProductVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller("orderController")
@RequestMapping("/damtuh/order/*")
@Log4j
@RequiredArgsConstructor
public class OrderController {

	private final ProductService service;

	private final OrderService orderService;

	private final MemberService memberService;

	@ResponseBody
	@RequestMapping(value = "/orderPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String orderPage(OrderDetailVO orderDetailVO, @RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		ProductVO productDetail = service.productDetailList(productId);
		log.info("order1 : " + orderDetailVO);
		log.info("productDetail:" + productDetail);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		MemberVO member = memberService.read(userDetails.getUsername());
		model.addAttribute("product", productDetail);
		model.addAttribute("product2", orderDetailVO);
		model.addAttribute("member", member);
		model.addAttribute("title", "주문");
		return "/damtuh/order/orderPage";
	}

	@RequestMapping(value = "/orderConfirm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String orderConfirm(OrderVO orderVO, OrderDetailVO orderDetailVO, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(request.getParameter("ordererName"));
		log.info(request.getParameter("deliveryId"));
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;
		orderVO.setDeliveryId(orderId);
		log.info("orderDetailVO" + orderDetailVO);
		log.info(orderVO.toString());
		orderService.insertComment(orderVO);
		orderService.insertOrder(orderVO);
		String delivery = orderVO.getDeliveryId();
		OrderVO order = orderService.selectOrder(delivery);
		model.addAttribute("order", order);
		model.addAttribute("title", "주문");
		return "/damtuh/order/orderConfirm";
	}

}
