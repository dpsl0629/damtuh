package com.damtuh.main.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.damtuh.product.service.ProductService;
import com.damtuh.product.vo.ProductVO;
import com.damtuh.support.notice.service.SupportService;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

import lombok.AllArgsConstructor;

@Controller("mainController")
@AllArgsConstructor
public class MainControllerImpl {

	@Autowired
	private SupportService boardService;

	@Autowired
	private ProductService productService;

	@Autowired
	NoticeBoardVO noticeBoardVO;

	@RequestMapping(value = "/main/main", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<NoticeBoardVO> noticeList = boardService.getList(cri);
		List<ProductVO> productList = productService.productList();
		mav.addObject("noticeList", noticeList);
		mav.addObject("productList", productList);
		return mav;
	}
}