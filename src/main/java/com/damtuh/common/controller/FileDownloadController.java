package com.damtuh.common.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;

public interface FileDownloadController {
	
	public void thumbnails(@RequestParam("fileName") String fileName, HttpServletResponse response) throws Exception;
	
}
