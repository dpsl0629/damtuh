package com.damtuh.member.controller;

import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.damtuh.member.service.MemberService;
import com.damtuh.member.vo.CommentOrderVO;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.member.vo.OrderVO;

import lombok.extern.log4j.Log4j;

@Controller("memberController")
@Log4j
@EnableAspectJAutoProxy
@RequestMapping("/member/*")
public class MemberController {

	@Resource(name="MemberService")
	private MemberService memberService;

	@Resource
	private JavaMailSender mailSender;

	@Resource
	private BCryptPasswordEncoder pwdEncoder;

	// 로그인
	@RequestMapping(value = "/loginPage", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginPage(HttpServletRequest request, HttpServletResponse response, Model model,
			Authentication authentication) throws Exception {
		log.info("로그인 페이지");
		return "/member/loginPage";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = { RequestMethod.POST, RequestMethod.GET })
	public String join(Locale locale, Model model) throws Exception {
		return "/member/join";
	}

	// 아이디 중복체크
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	public @ResponseBody String memberIdChkPOST(@RequestParam(required = false, value = "memberId") String memberId)
			throws Exception {

		log.info("memberIdChk() 진입");
		log.info(memberId);

		int result = memberService.idCheck(memberId);

		log.info("결과값 = " + result);

		if (result != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}

	}

	// 이메일 인증번호
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String mailCheckGET(String email) throws Exception {

		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		String setFrom = "damtuh@damtuh.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (AddressException e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}

	// 회원가입 확인
	@RequestMapping(value = "/joinConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String joinConfirm(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(memberVO.getPw());
		log.info(pwdEncoder.encode(memberVO.getPw()));
		memberVO.setPw(pwdEncoder.encode(memberVO.getPw()));
		memberService.join(memberVO);
		memberService.auth(memberVO);
		model.addAttribute("memberVO", memberVO);
		return "/member/joinConfirm";
	}

	// 마이페이지
	@RequestMapping(value = "/myPage", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String userid = userDetails.getUsername();
		log.info(userDetails.getUsername());
		List<CommentOrderVO> orderList = memberService.readOrder(userid);
		int count = orderList.size();
		mav.setViewName(viewName);
		mav.addObject("count", count);
		mav.addObject("orderList", orderList);
		return mav;
	}

	// 수정 비밀번호 확인페이지
	@RequestMapping(value = "/modifyCheckForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyCheckForm(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		return "/member/modifyCheckForm";
	}

	// 수정 비밀번호 확인 페이지
	@RequestMapping(value = "/modifyCheck", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyCheck(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		// MemberVO memberVO = memberService.modifyCheck(userDetails.getUsername());
		log.info(userDetails.getUsername());
		String pw = memberVO.getPw();
		return pw;
	}

	// 회원정보 수정 폼
	@RequestMapping(value = "/memberModify", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberModify(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		log.info("id : " + userDetails.getUsername());
		String pw = memberService.modifyCheck(userDetails.getUsername());
		log.info(pw);
		log.info(request.getParameter("pw"));
		boolean check = pwdEncoder.matches(request.getParameter("pw"), pw);

		if (check) {
			MemberVO memberVO = memberService.read(userDetails.getUsername());
			model.addAttribute("memberVO", memberVO);
			return "/member/memberModify";
		} else {
			return "redirect:/member/modifyCheckForm";
		}
	}

	// 수정 확인
	@RequestMapping(value = "/modifyConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyConfirm(MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		log.info(vo.getPw());
		log.info("modify : " + pwdEncoder.encode(vo.getPw()));
		vo.setPw(pwdEncoder.encode(vo.getPw()));
		memberService.modify(vo);
		return "/member/modifyConfirm";
	}

	// 삭제 비밀번호 확인 페이지
	@RequestMapping(value = "/deleteCheckForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/member/deleteCheckForm";
	}

	// 삭제 확인 페이지
	@RequestMapping(value = "/deleteConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteConfirm(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		log.info("id : " + userDetails.getUsername());
		String pw = memberService.modifyCheck(userDetails.getUsername());
		log.info(pw);
		log.info(request.getParameter("pw"));
		boolean check = pwdEncoder.matches(request.getParameter("pw"), pw);

		if (check) {
			memberService.delete1(userDetails.getUsername());
			memberService.delete2(userDetails.getUsername());
			memberService.deleteProductOrder(userDetails.getUsername());
			SecurityContextHolder.clearContext();
			return "/member/deleteConfirm";
		} else {
			return "redirect:/member/deleteCheckForm";
		}
	}

	// 제품 코멘트 등록 페이지
	@RequestMapping(value = "/productCommentForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String productCommentForm(@ModelAttribute("orderVO") OrderVO orderVO, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();
		String deliveryId = request.getParameter("deliveryId");
		orderVO.setCustomerId(id);
		orderVO.setDeliveryId(deliveryId);
		OrderVO orderDetail = memberService.readOrderDetail(orderVO);
		log.info("아이디 " + id);
		log.info("딜리버리아이디 " + deliveryId);
		model.addAttribute("orderDetail", orderDetail);
		return "/member/productCommentForm";
	}

	// 제품 코멘트 작성 확인 페이지
	@ResponseBody
	@RequestMapping(value = "/commentConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String commentConfirm(CommentVO vo, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		vo.setUserId(userDetails.getUsername());
		memberService.comment(vo);
		log.info(vo);
		return "/member/commentConfirm";
	}

	// 작성한 코멘트 확인 페이지
	@RequestMapping(value = "/productCommentConfirm", method = { RequestMethod.POST, RequestMethod.GET })
	public String productCommentConfirm(@ModelAttribute("orderVO") OrderVO orderVO, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String deliveryId = request.getParameter("deliveryId");
		CommentVO order = memberService.productCommentConfirm(deliveryId);
		orderVO.setCustomerId(userDetails.getUsername());
		orderVO.setDeliveryId(deliveryId);
		OrderVO orderDetail = memberService.readOrderDetail(orderVO);
		model.addAttribute("order", order);
		model.addAttribute("orderDetail", orderDetail);
		return "/member/productCommentConfirm";
	}
}