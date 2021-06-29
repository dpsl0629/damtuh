package com.damtuh.product.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Component("ProductImageVO")
public class ProductImageVO {
	
	private int productId;
	
}
