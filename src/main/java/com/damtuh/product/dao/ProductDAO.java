package com.damtuh.product.dao;

import java.util.List;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.vo.ProductVO;
import org.springframework.dao.DataAccessException;

public interface ProductDAO {

	public List<ProductVO> showList() throws DataAccessException;

	public ProductVO productDetailList(int productId) throws DataAccessException;

	public int likeCheck(ProductVO productVO) throws DataAccessException;

	public List<CommentVO> readComment(int productId) throws DataAccessException;
}
