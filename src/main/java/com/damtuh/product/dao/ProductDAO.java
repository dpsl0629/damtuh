package com.damtuh.product.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> showList() throws DataAccessException;
	
	public ProductVO productDetailList(int productId) throws DataAccessException;
	
	public int likeCheck(ProductVO productVO) throws DataAccessException;
	
	public List<CommentVO> readComment(int productId) throws DataAccessException;
}
