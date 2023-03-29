package com.damtuh.main.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.damtuh.support.notice.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.damtuh.product.service.ProductService;
import com.damtuh.product.vo.ProductVO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

import lombok.AllArgsConstructor;

@Controller("mainController")
@AllArgsConstructor
public class MainController {

	@Resource(name = "BoardService")
	private BoardService boardService;

	@Resource(name = "ProductService")
	private ProductService productService;

	@RequestMapping(value = "/damtuh", method = { RequestMethod.POST, RequestMethod.GET })
	public String main(Criteria cri, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		// 공지사항
		List<NoticeBoardVO> noticeList = boardService.getList(cri);
		// 제품목록
		List<ProductVO> productList = productService.productList();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("productList", productList);
		return "/damtuh/index";
	}
}