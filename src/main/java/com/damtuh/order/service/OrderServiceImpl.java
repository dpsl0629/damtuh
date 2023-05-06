package com.damtuh.order.service;

import com.damtuh.order.dao.OrderDAO;
import com.damtuh.order.vo.OrderVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;

@Service("OrderService")
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrderDAO orderDAO;

	@Override
	public int insertOrder(OrderVO orderVO) {
		int orderInsert = orderDAO.insertOrder(orderVO);
		return orderInsert;
	}

	@Override
	public OrderVO selectOrder(String deliveryId) {
		OrderVO order = orderDAO.readOrder(deliveryId);
		return order;
	}

	@Override
	public int insertComment(OrderVO orderVO) {
		int commentInsert = orderDAO.insertCommnet(orderVO);
		return commentInsert;
	}

}
