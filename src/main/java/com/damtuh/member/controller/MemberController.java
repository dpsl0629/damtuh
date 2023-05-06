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

import com.damtuh.member.service.MemberService;
import com.damtuh.member.vo.CommentOrderVO;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.order.vo.OrderVO;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.log4j.Log4j;

@Controller("memberController")
@Log4j
@RequestMapping(value="/damtuh/member/*")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;

	private final JavaMailSender mailSender;

	private final BCryptPasswordEncoder pwdEncoder;

	// 로그인
	@RequestMapping(value = "/loginPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginPage(Model model) throws Exception {
		log.info("로그인 페이지");
		model.addAttribute("title", "로그인");
		return "/damtuh/member/loginPage";
	}

	// 회원가입
	@RequestMapping(value = "/join.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String join(Model model) throws Exception {
		model.addAttribute("title", "회원가입");
		return "/damtuh/member/join";
	}

	// 아이디 중복체크
	@RequestMapping(value = "/memberIdChk.do", method = RequestMethod.POST)
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
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.GET)
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
	@RequestMapping(value = "/joinConfirm.do", method = { RequestMethod.POST, RequestMethod.GET })
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
	@RequestMapping(value = "/myPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String myPage(Model model)
			throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String userid = userDetails.getUsername();
		log.info(userDetails.getUsername());
		List<CommentOrderVO> orderList = memberService.readOrder(userid);
		int count = orderList.size();
		model.addAttribute("count", count);
		model.addAttribute("orderList", orderList);
		model.addAttribute("title", "마이페이지");
		return "/damtuh/member/myPage";
	}

	// 수정 비밀번호 확인페이지
	@RequestMapping(value = "/modifyCheckForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyCheckForm(Model model)
			throws Exception {
		model.addAttribute("title", "비밀번호 확인");
		return "/damtuh/member/modifyCheckForm";
	}

	// 수정 비밀번호 확인
	@RequestMapping(value = "/modifyCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyCheck(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		log.info(userDetails.getUsername());
		String pw = memberVO.getPw();
		return pw;
	}

	// 회원정보 수정 폼
	@RequestMapping(value = "/memberModify.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberModify(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		log.info("id : " + userDetails.getUsername());
		String pw = memberService.modifyCheck(userDetails.getUsername());
		log.info(pw);
		log.info(request.getParameter("pw"));
		boolean check = pwdEncoder.matches(request.getParameter("pw"), pw);
		model.addAttribute("title", "ㅣ회원정보 수정");
		if (check) {
			MemberVO memberVO = memberService.read(userDetails.getUsername());
			model.addAttribute("memberVO", memberVO);
			return "/damtuh/member/memberModify";
		} else {
			return "redirect:/damtuh/member/modifyCheckForm";
		}
	}

	// 수정 확인
	@RequestMapping(value = "/modifyConfirm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String modifyConfirm(Model model, MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		log.info(vo.getPw());
		log.info("modify : " + pwdEncoder.encode(vo.getPw()));
		vo.setPw(pwdEncoder.encode(vo.getPw()));
		memberService.modify(vo);
		model.addAttribute("title", "수정 확인");
		return "/damtuh/member/modifyConfirm";
	}

	// 삭제 비밀번호 확인 페이지
	@RequestMapping(value = "/deleteCheckForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberDelete(Model model) throws Exception {
		model.addAttribute("title", "삭제 비밀번호 확인");
		return "/damtuh/member/deleteCheckForm";
	}

	// 삭제 확인 페이지
	@RequestMapping(value = "/deleteConfirm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteConfirm(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		log.info("id : " + userDetails.getUsername());
		String pw = memberService.modifyCheck(userDetails.getUsername());
		log.info(pw);
		log.info(request.getParameter("pw"));
		boolean check = pwdEncoder.matches(request.getParameter("pw"), pw);

		model.addAttribute("title", "삭제 확인");
		if (check) {
			memberService.delete1(userDetails.getUsername());
			memberService.delete2(userDetails.getUsername());
			memberService.deleteProductOrder(userDetails.getUsername());
			SecurityContextHolder.clearContext();
			return "/damtuh/member/deleteConfirm";
		} else {
			return "redirect:/damtuh/member/deleteCheckForm";
		}
	}

	// 제품 코멘트 등록 페이지
	@RequestMapping(value = "/productCommentForm.do", method = { RequestMethod.POST, RequestMethod.GET })
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
		model.addAttribute("title", "리뷰 작성");
		return "/damtuh/member/productCommentForm";
	}

	// 제품 코멘트 작성 확인 페이지
	@ResponseBody
	@RequestMapping(value = "/commentConfirm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String commentConfirm(CommentVO vo, Model model)
			throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		vo.setUserId(userDetails.getUsername());
		memberService.comment(vo);
		log.info(vo);
		model.addAttribute("title", "리뷰 작성");
		return "/damtuh/member/commentConfirm";
	}

	// 작성한 코멘트 확인 페이지
	@RequestMapping(value = "/productCommentConfirm.do", method = { RequestMethod.POST, RequestMethod.GET })
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
		model.addAttribute("title", "리뷰 작성");
		return "/damtuh/member/productCommentConfirm";
	}
}