package com.damtuh.support.notice.vo;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("NoticeBoardVO")
public class NoticeBoardVO {

	private Long bno;
	private String title;
	private String content;
	private Long attach;
	private Date writeDate;
	private Long hits;

	private List<BoardAttachVO> attachList;
}
