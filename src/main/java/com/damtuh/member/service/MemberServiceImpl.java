package com.damtuh.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.damtuh.member.dao.MemberDAO;
import com.damtuh.member.vo.CommentOrderVO;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.member.vo.OrderVO;
import lombok.AllArgsConstructor;

@Service("MemberService")
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int idCheck(String id) {
		int result = memberDAO.idCheck(id);
		System.out.println(result);
		return result;
	}

	@Override
	public void join(MemberVO vo) {
		memberDAO.join(vo);
	}

	@Override
	public void auth(MemberVO vo) {
		memberDAO.auth(vo);
	}

	@Override
	public void resetFailCnt(String userid) {
		memberDAO.resetFailCnt(userid);
	}

	@Override
	public List<CommentOrderVO> readOrder(String userid) {
		List<CommentOrderVO> orderList = memberDAO.readOrder(userid);
		return orderList;
	}

	@Override
	public MemberVO read(String userid) {
		MemberVO vo = memberDAO.read(userid);
		return vo;
	}

	@Override
	public int modify(MemberVO memberVO) {
		int modifyNum = memberDAO.modify(memberVO);
		return modifyNum;
	}

	@Override
	public String modifyCheck(String userid) {
		String pw = memberDAO.modifyCheck(userid);
		return pw;
	}

	@Override
	public int delete1(String userid) {
		int deleteNum = memberDAO.delete1(userid);
		return deleteNum;
	}

	@Override
	public int delete2(String userid) {
		int deleteNum = memberDAO.delete2(userid);
		return deleteNum;
	}

	@Override
	public OrderVO readOrderDetail(OrderVO orderVO) {
		OrderVO orderDetail = memberDAO.readOrderDetail(orderVO);
		return orderDetail;
	}

	@Override
	public int comment(CommentVO commentVO) {
		int commentNum = memberDAO.comment(commentVO);
		return commentNum;
	}

	@Override
	public List<CommentVO> selectComment(String deliveryId) {
		List<CommentVO> comment = memberDAO.selectComment(deliveryId);
		return comment;
	}

	@Override
	public CommentVO productCommentConfirm(String deliveryId) {
		CommentVO order = memberDAO.productCommentConfirm(deliveryId);
		return order;
	}

	@Override
	public void deleteProductOrder(String userid) {
		memberDAO.deleteProductOrder(userid);
	}

}
