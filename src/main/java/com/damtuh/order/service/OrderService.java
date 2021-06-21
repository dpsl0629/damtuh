package com.damtuh.order.service;

import com.damtuh.order.vo.OrderVO;

public interface OrderService {

	public int insertOrder(OrderVO orderVO);
	
	public OrderVO selectOrder(String deliveryId);
	
	public int insertComment(OrderVO orderVO);
}
