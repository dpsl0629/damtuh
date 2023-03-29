package com.damtuh.mapper;

import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.order.vo.OrderVO;

import java.util.List;

public interface MemberMapper {

	public int idCheck(String id);

	public void join(MemberVO vo);

	public void auth(MemberVO vo);

	public MemberVO read(String userid);

	public void resetFailCnt(String userid);

	public List<OrderVO> readOrder(String userid);

	public int modify(MemberVO vo);

	public int modifyCheck(String userid);

	public int delete1(String userid);

	public int delete2(String userid);

	public void deleteProductOrder(String userid);

	public List<OrderVO> readOrderDetail(MemberVO vo);

	public int comment(CommentVO commentVO);

	public List<CommentVO> selectComment(String deliveryId);

	public OrderVO readDeliveryId(String userid);

	public OrderVO productCommentConfirm(String deliveryId);

}
