package com.damtuh.order.dao;

import com.damtuh.order.vo.OrderVO;

public interface OrderDAO {

	public int insertOrder(OrderVO orderVO);

	public OrderVO readOrder(String deliveryId);

	public int insertCommnet(OrderVO orderVO);
}
