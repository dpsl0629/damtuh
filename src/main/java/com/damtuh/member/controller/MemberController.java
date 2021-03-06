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
		log.info("????????? ?????????");
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
		
		log.info("memberIdChk() ??????");
		log.info(memberId);
		
		int result = memberService.idCheck(memberId);
		
		log.info("????????? = " + result);
		
		if(result != 0) {
			
			return "fail";	// ?????? ???????????? ??????
			
		} else {
			
			return "success";	// ?????? ????????? x
			
		}	
		
	}
	
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	 @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* ???(View)????????? ????????? ????????? ?????? */
	        log.info("????????? ????????? ?????? ??????");
	        log.info("???????????? : " + email);
	                
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("???????????? " + checkNum);
	        
	        String setFrom = "sjinjin6@naver.com";
	        String toMail = email;
	        String title = "???????????? ?????? ????????? ?????????.";
	        String content = 
	                "??????????????? ?????????????????? ???????????????." +
	                "<br><br>" + 
	                "?????? ????????? " + checkNum + "?????????." + 
	                "<br>" + 
	                "?????? ??????????????? ???????????? ???????????? ???????????? ?????????.";

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