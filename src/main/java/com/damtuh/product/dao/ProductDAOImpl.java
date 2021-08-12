package com.damtuh.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.product.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository("ProductDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> showList() throws DataAccessException {
		List<ProductVO> productList = sqlSession.selectList("com.damtuh.mapper.ProductMapper.productList");
		return productList;
	}

	@Override
	public ProductVO productDetailList(int productId) throws DataAccessException {
		ProductVO productDetail = sqlSession.selectOne("com.damtuh.mapper.ProductMapper.productDetailList", productId);
		return productDetail;
	}

	@Override
	public int likeCheck(ProductVO productVO) throws DataAccessException {
		log.info("dao");
		log.info("dao : " + productVO);
		int result = sqlSession.update("com.damtuh.mapper.ProductMapper.likeCheck", productVO);
		return result;
	}

	@Override
	public List<CommentVO> readComment(int productId) throws DataAccessException {
		List<CommentVO> commentList = sqlSession.selectList("com.damtuh.mapper.ProductMapper.selectComment", productId);
		return commentList;
	}

}
