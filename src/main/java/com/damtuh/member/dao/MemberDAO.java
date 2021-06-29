package com.damtuh.member.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.damtuh.member.vo.CommentOrderVO;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.member.vo.OrderVO;

public interface MemberDAO {
	
	public int idCheck(String id) throws DataAccessException;

	public void join(MemberVO vo) throws DataAccessException;
	
	public void auth(MemberVO vo) throws DataAccessException;
	
	public void resetFailCnt(String userid) throws DataAccessException;

	public List<CommentOrderVO> readOrder(String userid) throws DataAccessException;
	
	public MemberVO read(String userid) throws DataAccessException;
	
	public int modify(MemberVO vo) throws DataAccessException;
	
	public String modifyCheck(String userid) throws DataAccessException;
	
	public int delete1(String userid) throws DataAccessException;
	
	public int delete2(String userid) throws DataAccessException;
	
	public OrderVO readOrderDetail(OrderVO orderVO) throws DataAccessException;
	
	public int comment(CommentVO commentVO) throws DataAccessException;
	
	public List<CommentVO> selectComment(String deliveryId) throws DataAccessException;
	
	public CommentVO productCommentConfirm(String deliveryId) throws DataAccessException;

}
 