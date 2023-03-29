package com.damtuh.mapper;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.vo.ProductImageVO;
import com.damtuh.product.vo.ProductVO;

import java.util.List;

public interface ProductMapper {

	public List<ProductVO> productList();

	public List<ProductImageVO> productIamgeList(ProductVO productId);

	public int likeCheck(ProductVO productVO);

	public List<CommentVO> readComment(String productId);
}
