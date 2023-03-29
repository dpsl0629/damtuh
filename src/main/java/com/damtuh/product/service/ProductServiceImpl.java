package com.damtuh.product.service;

import java.util.List;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.dao.ProductDAO;
import com.damtuh.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("ProductService")
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Override
	public List<ProductVO> productList() {
		log.info("getList........");
		List<ProductVO> productList = productDAO.showList();
		return productList;
	}

	@Override
	public ProductVO productDetailList(int productId) {
		ProductVO productDetail = productDAO.productDetailList(productId);
		return productDetail;
	}

	@Override
	public int likeCheck(ProductVO productVO) {
		log.info("service : " + productVO);
		int result = productDAO.likeCheck(productVO);
		return result;
	}

	@Override
	public List<CommentVO> readComment(int productId) {
		List<CommentVO> productList = productDAO.readComment(productId);
		return productList;
	}

}
