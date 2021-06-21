package com.damtuh.product.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.service.ProductService;
import com.damtuh.product.vo.ProductVO;
import lombok.extern.log4j.Log4j;

@Controller("productController")
@RequestMapping("/product/*")
@Log4j
@EnableAspectJAutoProxy
public class ProductControllerImpl implements ProductController {
	
	@Autowired
	ProductService service;
	
	@Autowired
	ProductVO productVO;

	@Override
	@RequestMapping(value= "/productList" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<ProductVO> productList = service.productList();
		log.info(productList.get(0));
		//log.info(productImageList.get(0));
		mav.addObject("list", productList);
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/productDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView productDetail(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ProductVO productDetail= service.productDetailList(productId);
		//log.info(productImageList.get(0));
		List<CommentVO> commentList = service.readComment(productId);
		log.info(productDetail);
		mav.addObject("product", productDetail);
		mav.addObject("commentList", commentList);
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/likeCheck" ,method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String likeCheck(@RequestParam(required = false, value = "cnt") int cnt, @RequestParam(required = false, value = "productId") int productId, HttpServletRequest request, HttpServletResponse response) throws Exception{
		log.info("likeCheck");
		productVO.setLikeCount(cnt);
		productVO.setProductId(productId);
		log.info(productVO);
		service.likeCheck(productVO);
		return "success";
	}
	
	
}