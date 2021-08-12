package com.damtuh.member.vo;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component("OrderVO2")
public class OrderVO {

	private String deliveryId;
	private String customerId;
	private int productId;
	private String productImage;
	private String productName;
	private int quantity;
	private int delivery;
	private String productPrice;
	private String totalPrice;
	private int point;
	private String ordererName;
	private String ordererTel;
	private String ordererPhone;
	private String ordererEmail;
	private String receiverName;
	private String receiverZip;
	private String receiverAddress;
	private String receiverAddressDetail;
	private String receiverTel;
	private String receiverPhone;
	private String deliveryMemo;
	private Date orderDate;
	private String ordererZip;
	private String ordererAddress;
	private String ordererAddressDetail;

}
