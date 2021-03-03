package com.damtuh.support.notice.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("NoticeBoardVO")
public class NoticeBoardVO {

	private Long bno;
	private String title;
	private String content;
	private int attach;
	private Date writeDate;
	private Long hits;
	
}
