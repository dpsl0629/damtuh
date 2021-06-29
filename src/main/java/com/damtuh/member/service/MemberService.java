package com.damtuh.member.service;

import java.util.List;

import com.damtuh.member.vo.CommentOrderVO;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.member.vo.OrderVO;

public interface MemberService {
	
	public int idCheck(String id);
	
	public void join(MemberVO vo);
	
	public void auth(MemberVO vo);
	
	public void resetFailCnt(String userid);

	public List<CommentOrderVO> readOrder(String userid);
	
	public MemberVO read(String userid);
	
	public int modify(MemberVO memberVO);
	
	public String modifyCheck(String userid);
	
	public int delete1(String userid);
	
	public int delete2(String userid);
	
	public OrderVO readOrderDetail(OrderVO orderVO);
	
	public int comment(CommentVO commentVO);
	
	public List<CommentVO> selectComment(String deliveryId);
	
	public CommentVO productCommentConfirm(String deliveryId);

}
