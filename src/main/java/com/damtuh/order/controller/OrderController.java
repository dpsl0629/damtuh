package com.damtuh.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.damtuh.member.service.MemberService;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.order.service.OrderService;
import com.damtuh.order.vo.OrderDetailVO;
import com.damtuh.order.vo.OrderVO;
import com.damtuh.product.service.ProductService;
import com.damtuh.product.vo.ProductVO;
import lombok.extern.log4j.Log4j;

@Controller("orderController")
@RequestMapping("/order/*")
@Log4j
@EnableAspectJAutoProxy
public class OrderController {

	@Autowired
	MemberVO memberVO;

	@Autowired
	ProductVO productVO;

	@Autowired
	OrderDetailVO orderDetailVO;

	@Autowired
	OrderVO orderVO;

	@Autowired
	ProductService service;

	@Autowired
	OrderService orderService;

	@Autowired
	MemberService memberService;

	@ResponseBody
	@RequestMapping(value = "/orderPage", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderPage(OrderDetailVO orderDetailVO, @RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ProductVO productDetail = service.productDetailList(productId);
		log.info("order1 : " + orderDetailVO);
		log.info("productDetail:" + productDetail);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		MemberVO member = memberService.read(userDetails.getUsername());
		mav.addObject("product", productDetail);
		mav.addObject("product2", orderDetailVO);
		mav.addObject("member", member);
		return mav;
	}

	@RequestMapping(value = "/orderConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderConfirm(OrderVO orderVO, OrderDetailVO orderDetailVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		log.info(request.getParameter("ordererName"));
		log.info(request.getParameter("deliveryNum"));
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
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("order", order);
		return mav;
	}

}
