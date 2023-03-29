package com.damtuh.product.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.service.ProductService;
import com.damtuh.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j;

@Controller("productController")
@RequestMapping("/damtuh/product/*")
@Log4j
@EnableAspectJAutoProxy
public class ProductController {

	@Autowired
	ProductService service;

	@Autowired
	ProductVO productVO;

	@RequestMapping(value = "/productList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String productList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		List<ProductVO> productList = service.productList();
		// log.info(productImageList.get(0));
		model.addAttribute("list", productList);
		return "/damtuh/product/productList";
	}

	@RequestMapping(value = "/productDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String productDetail(@RequestParam("productId") int productId, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		ProductVO productDetail = service.productDetailList(productId);
		// log.info(productImageList.get(0));
		List<CommentVO> commentList = service.readComment(productId);
		log.info(productDetail);
		model.addAttribute("product", productDetail);
		model.addAttribute("commentList", commentList);
		return "/damtuh/product/productDetail";
	}

	@RequestMapping(value = "/likeCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String likeCheck(@RequestParam(required = false, value = "cnt") int cnt,
			@RequestParam(required = false, value = "productId") int productId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("likeCheck");
		productVO.setLikeCount(cnt);
		productVO.setProductId(productId);
		log.info(productVO);
		service.likeCheck(productVO);
		return "success";
	}
}