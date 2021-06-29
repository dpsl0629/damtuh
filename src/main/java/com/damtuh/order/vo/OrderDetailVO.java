package com.damtuh.order.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Component("OrderDetailVO")
public class OrderDetailVO {

	private int productId;
	private String productName;
	private String productPrice;
	private String productImage;
	private int quantity;
	private int delivery;
	private String totalPrice;
	private int point;
}
