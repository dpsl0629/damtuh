package com.damtuh.member.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Component;
import lombok.Data;
import lombok.ToString;

@ToString
@Data
@Component("MemberVO")
public class MemberVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
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
	private List<AuthVO> authList;
	
}
