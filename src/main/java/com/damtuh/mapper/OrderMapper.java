package com.damtuh.mapper;

import com.damtuh.order.vo.OrderVO;

public interface OrderMapper {

	public int insertOrder();
	
	public OrderVO selectOrder();
	
}
