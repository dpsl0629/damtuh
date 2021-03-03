package com.damtuh.member.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.damtuh.mapper.MemberMapper;
import com.damtuh.member.service.MemberService;
import com.damtuh.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller("memberController")
@Log4j
@EnableAspectJAutoProxy
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
    private BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping(value= "/loginPage")
	public String loginPage(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws Exception{
		log.info("로그인 페이지");
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
		return "member/loginPage";
	}
	
	@RequestMapping(value= "/join" ,method={RequestMethod.POST,RequestMethod.GET})
	public String join(Locale locale, Model model) throws Exception{
		return "member/join";
	}
	
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	public @ResponseBody String memberIdChkPOST(@RequestParam(required = false, value = "memberId") String memberId) throws Exception{
		
		log.info("memberIdChk() 진입");
		log.info(memberId);
		
		int result = memberService.idCheck(memberId);
		
		log.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
		
	}
	
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	 @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인");
	        log.info("인증번호 : " + email);
	                
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 " + checkNum);
	        
	        String setFrom = "sjinjin6@naver.com";
	        String toMail = email;
	        String title = "회원가입 인증 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(AddressException e) {
	            e.printStackTrace();
	        }

	        String num = Integer.toString(checkNum);

	        return num;


	    } 
	
	@RequestMapping(value = "/joinForm",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView joinForm(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		log.info(vo.getPw());
	    log.info(pwdEncoder.encode(vo.getPw()));
	    vo.setPw(pwdEncoder.encode(vo.getPw()));
		memberService.join(vo);
		mav.setViewName(viewName);
		mav.addObject("memberVO", memberVO);
		return mav;
	}

	@GetMapping("/all")
	public void doAll() {
		log.info("do All");
	}
	
	@GetMapping("/member")
	public String doMember() {
		log.info("do Member");
		return "member/member";
	}

}