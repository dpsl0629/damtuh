package com.damtuh.mapper;

import java.util.List;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.vo.ProductImageVO;
import com.damtuh.product.vo.ProductVO;

public interface ProductMapper {

	public List<ProductVO> productList();

	public List<ProductImageVO> productIamgeList(ProductVO productId);

	public int likeCheck(ProductVO productVO);

	public List<CommentVO> readComment(String productId);
}
