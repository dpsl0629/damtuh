package com.damtuh.member.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Component("MemberVO")
public class MemberVO {
	
	private int numberId;
	private String name;
	private String id;
	private String pw;
	private String email;
	private int zipcode;
	private String address1;
	private String address2;
	private String phone;
	private String birth;
	private Date joinDate;
	
}
