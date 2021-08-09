package com.damtuh.mapper;

import com.damtuh.order.vo.OrderVO;

public interface OrderMapper {

	public int insertOrder(OrderVO orderVO);
	
	public OrderVO selectOrder();
	
	public int insertComment(OrderVO orderVO);
	
}
