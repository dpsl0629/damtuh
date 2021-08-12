package com.damtuh.product.service;

import java.util.List;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> productList();

	public ProductVO productDetailList(int productId);

	public int likeCheck(ProductVO productVO);

	public List<CommentVO> readComment(int productId);
}
