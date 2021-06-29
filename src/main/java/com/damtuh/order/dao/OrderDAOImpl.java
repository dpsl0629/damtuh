package com.damtuh.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.damtuh.order.vo.OrderVO;

@Repository("OrderDAO")
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertOrder(OrderVO orderVO) {
		int orderInsert = sqlSession.insert("com.damtuh.mapper.OrderMapper.insertOrder", orderVO);
		return orderInsert;
	}

	@Override
	public OrderVO readOrder(String deliveryId) {
		OrderVO order = sqlSession.selectOne("com.damtuh.mapper.OrderMapper.selectOrder", deliveryId);
		return order;
	}

	@Override
	public int insertCommnet(OrderVO orderVO) {
		int orderInsert = sqlSession.insert("com.damtuh.mapper.OrderMapper.insertComment", orderVO);
		return orderInsert;
	}

}
