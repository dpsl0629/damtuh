package com.damtuh.support.notice.vo;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
