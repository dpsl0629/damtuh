package com.damtuh.common.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller("FileDownloadController")
public class FileDownloadControllerImpl implements FileDownloadController {

	private static String CURR_IMAGE_REPO_PATH = "C:\\damtuh\\file_repo";

	@RequestMapping("/thumbnails.do")
	public void thumbnails(@RequestParam("fileName") String fileName, HttpServletResponse response) throws Exception {
		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();

		try {

			// 이미지 파일 읽기
			String file = CURR_IMAGE_REPO_PATH + "\\" + fileName;

			// thumbnailator를 이용하여 썸네일 125*125 사이즈, 확장자jpeg로 변경
			BufferedImage image = Thumbnails.of(file).size(500, 500).outputFormat("jpeg").asBufferedImage();

			ImageIO.write(image, "jpeg", jpegOutputStream);

		} catch (IllegalArgumentException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

		byte[] imgByte = jpegOutputStream.toByteArray();

		
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream responseOutputStream = response.getOutputStream();
		responseOutputStream.write(imgByte);
		responseOutputStream.flush();
		responseOutputStream.close();

	}

}
