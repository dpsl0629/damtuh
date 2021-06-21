package com.damtuh.product.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Component("ProductVO")
public class ProductVO {

	private int productId;
	private String productName;
	private int likeCount;
	private int productPrice;
	private String type;
	private String calorie;
	private String weight;
	private String contryOrigin;
	private String modelNum;
	private String productNum;
	private String state;
	private String brand;
	private String contryProduce;
	private String tel;
	private String expiryDate;
	private String kind;
	private String producer;
	private int saleVolumn;
	private String fileName;
	private String fileType;
	private String thumbnail1;
	private String thumbnail2;
	private String thumbnail3;
	private String thumbnail4;
	
}
