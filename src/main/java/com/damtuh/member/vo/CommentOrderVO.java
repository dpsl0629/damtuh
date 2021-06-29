package com.damtuh.member.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("CommentOrderVO")
public class CommentOrderVO {
	private OrderVO orderVO;
	private CommentVO commentVO;
}
