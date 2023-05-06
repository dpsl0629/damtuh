package com.damtuh.order.dao;

import com.damtuh.order.vo.OrderVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("OrderDAO")
@RequiredArgsConstructor
public class OrderDAOImpl implements OrderDAO {

	private final SqlSession sqlSession;

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
