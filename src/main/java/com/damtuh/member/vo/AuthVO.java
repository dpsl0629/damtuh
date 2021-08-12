package com.damtuh.member.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("AuthVO")
public class AuthVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String userId;
	private String auth;

}
