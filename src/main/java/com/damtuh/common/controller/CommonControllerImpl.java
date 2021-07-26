package com.damtuh.common.controller;

import java.io.File;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller("CommonController")
@EnableAspectJAutoProxy
public class CommonControllerImpl implements CommonController {


//	@RequestMapping(value= "/login" ,method={RequestMethod.POST,RequestMethod.GET})
//	public String loginGET(HttpServletRequest request, HttpServletResponse response) {
//		RequestCache requestCache = new HttpSessionRequestCache();
//		SavedRequest savedRequest = requestCache.getRequest(request, response); 
//		
//		try {
//			request.getSession().setAttribute("prevPage", savedRequest.getRedirectUrl());
//		} catch(NullPointerException e) {
//			request.getSession().setAttribute("prevPage", "/");
//		}
//		return "login";
//	}
//	
//	@RequestMapping(value= "/logout" ,method={RequestMethod.POST,RequestMethod.GET})
//	public void logout(Locale locale, Model model) throws Exception{
//		log.info("로그아웃");
//	}
//	
//	@GetMapping("/accessError")
//	public void accessDenied(Authentication auth, Model model) {
//		log.info("access Denied : " + auth);
//	}
	
	@Override
	@GetMapping(value="/upload")
	public void upload(MultipartFile[] uploadFile) throws Exception {
		log.info("uploadAjax");
		
		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile ) {
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only File Name " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

}
