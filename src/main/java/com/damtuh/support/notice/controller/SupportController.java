package com.damtuh.support.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damtuh.support.notice.vo.AttachFileDTO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

@Controller("supportController")
@RequestMapping("/support/*")
public interface SupportController {
	
	public ModelAndView notice(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String noticeConfirm(@ModelAttribute("vo") NoticeBoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeWrite(@ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modifyWrite(@ModelAttribute("cri") Criteria cri, @RequestParam("bno") Long bno,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String modifyConfirm(@ModelAttribute("cri") Criteria cri, @ModelAttribute("vo") NoticeBoardVO vo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception;
	
	public String deleteConfirm(@RequestParam("bno") Long bno, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception;
	
	public ResponseEntity<List<AttachFileDTO>> upload(MultipartFile[] uploadFile) throws Exception;
	
	public ResponseEntity<byte[]> getFile(String fileName);
	
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName);
	
	public ResponseEntity<String> deleteFile(String fileName, String type);
}