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
public class OrderControllerImpl implements OrderController {
	
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
	
	@RequestMapping(value= "/orderPage" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView orderPage(@RequestParam("productId") int productId, @RequestParam("totalPrice") String totalPrice, @RequestParam("quantity") int quantity, @RequestParam("productName") String productName, @RequestParam("productPrice") String productPrice,   @RequestParam("productImage") String productImage,  @RequestParam("delivery") int delivery, @RequestParam("point") int point, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ProductVO productDetail= service.productDetailList(productId);
		//log.info(productImageList.get(0));
		log.info(productDetail);
		orderDetailVO.setTotalPrice(request.getParameter("totalPrice"));
		orderDetailVO.setQuantity(quantity);
		orderDetailVO.setProductName(productName);
		orderDetailVO.setProductPrice(productPrice);
		orderDetailVO.setProductId(productId);
		orderDetailVO.setProductImage(productImage);
		orderDetailVO.setDelivery(delivery);
		orderDetailVO.setPoint(point);
		log.info(orderDetailVO.getProductPrice());
		log.info(orderDetailVO.getQuantity());
		log.info(orderDetailVO.getProductName());
		log.info(orderDetailVO.getProductPrice());
		log.info(orderDetailVO);
		log.info("delivery : " + delivery);
		log.info(productName);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal;
		MemberVO member = memberService.read(userDetails.getUsername());
		mav.addObject("product", productDetail);
		mav.addObject("product2", orderDetailVO);
		mav.addObject("member", member);
		return mav;
	}

	@RequestMapping(value= "/orderConfirm" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView orderConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		log.info(request.getParameter("ordererName"));
		log.info(request.getParameter("deliveryNum"));
		Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String orderId = ymd + "_" + subNum;
		orderVO.setDeliveryId(orderId);
		orderVO.setCustomerId(request.getParameter("customerId"));
		orderVO.setProductId(orderDetailVO.getProductId());
		orderVO.setProductImage(orderDetailVO.getProductImage());
		orderVO.setProductName(orderDetailVO.getProductName());
		orderVO.setQuantity(orderDetailVO.getQuantity());
		orderVO.setDelivery(orderDetailVO.getDelivery());
		orderVO.setProductPrice(orderDetailVO.getProductPrice());
		orderVO.setTotalPrice(request.getParameter("totalPrice"));
		orderVO.setPoint(orderDetailVO.getPoint());
		orderVO.setOrdererName(request.getParameter("ordererName"));
		orderVO.setOrdererTel(request.getParameter("ordererTel"));
		orderVO.setOrdererPhone(request.getParameter("ordererPhone"));
		orderVO.setOrdererEmail(request.getParameter("ordererEmail"));
		orderVO.setReceiverName(request.getParameter("receiverName"));
		orderVO.setReceiverZip(request.getParameter("receiverZip"));
		orderVO.setReceiverAddress(request.getParameter("receiverAddress"));
		orderVO.setReceiverAddressDetail(request.getParameter("receiverAddressDetail"));
		orderVO.setReceiverTel(request.getParameter("receiverTel"));
		orderVO.setReceiverPhone(request.getParameter("receiverPhone"));
		orderVO.setDeliveryMemo(request.getParameter("deliveryMemo"));
		orderVO.setOrdererZip(request.getParameter("ordererZip"));
		orderVO.setOrdererAddress(request.getParameter("ordererAddress"));
		orderVO.setOrdererAddressDetail(request.getParameter("ordererAddressDetail"));
		log.info(orderVO.toString());
		orderService.insertOrder(orderVO);
		orderService.insertComment(orderVO);
		String delivery = orderVO.getDeliveryId(); 
		OrderVO order = orderService.selectOrder(delivery);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("order", order);
		return mav;
	}

}
