package com.damtuh.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.damtuh.member.vo.CommentOrderVO;
import com.damtuh.member.vo.CommentVO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.member.vo.OrderVO;

@Repository("MemberDAOImpl")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int idCheck(String id) throws DataAccessException {
		System.out.println(id);
		int result = sqlSession.selectOne("com.damtuh.mapper.MemberMapper.idCheck", id);
		System.out.println(result);
		return result;
	}

	@Override
	public void join(MemberVO vo) throws DataAccessException {
		sqlSession.selectOne("com.damtuh.mapper.MemberMapper.join", vo);
	}

	@Override
	public void auth(MemberVO vo) throws DataAccessException {
		sqlSession.selectOne("com.damtuh.mapper.MemberMapper.auth", vo);
	}

	@Override
	public void resetFailCnt(String userid) throws DataAccessException {
		sqlSession.selectOne("com.damtuh.mapper.MemberMapper.resetFailCnt", userid);
	}

	@Override
	public List<CommentOrderVO> readOrder(String userid) throws DataAccessException {
		List<CommentOrderVO> orderList = sqlSession.selectList("com.damtuh.mapper.MemberMapper.readOrder", userid);
		return orderList;
	}

	@Override
	public MemberVO read(String userid) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("com.damtuh.mapper.MemberMapper.read", userid);
		return vo;
	}

	@Override
	public int modify(MemberVO memberVO) throws DataAccessException {
		int modifyNum = sqlSession.update("com.damtuh.mapper.MemberMapper.modify", memberVO);
		return modifyNum;
	}

	@Override
	public String modifyCheck(String userid) throws DataAccessException {
		String pw = sqlSession.selectOne("com.damtuh.mapper.MemberMapper.modifyCheck", userid);
		return pw;
	}

	@Override
	public int delete1(String userid) throws DataAccessException {
		int deleteNum = sqlSession.delete("com.damtuh.mapper.MemberMapper.delete1", userid);
		return deleteNum;
	}

	@Override
	public int delete2(String userid) throws DataAccessException {
		int deleteNum = sqlSession.delete("com.damtuh.mapper.MemberMapper.delete2", userid);
		return deleteNum;
	}

	@Override
	public void deleteProductOrder(String userid) throws DataAccessException {
		sqlSession.delete("com.damtuh.mapper.MemberMapper.deleteProductOrder", userid);
	}

	@Override
	public OrderVO readOrderDetail(OrderVO orderVO) throws DataAccessException {
		OrderVO orderDetail = sqlSession.selectOne("com.damtuh.mapper.MemberMapper.readOrderDetail", orderVO);
		return orderDetail;
	}

	@Override
	public int comment(CommentVO commentVO) throws DataAccessException {
		int commentNum = sqlSession.update("com.damtuh.mapper.MemberMapper.comment", commentVO);
		return commentNum;
	}

	@Override
	public List<CommentVO> selectComment(String deliveryId) throws DataAccessException {
		List<CommentVO> comment = sqlSession.selectList("com.damtuh.mapper.MemberMapper.selectComment", deliveryId);
		return comment;
	}

	@Override
	public CommentVO productCommentConfirm(String deliveryId) throws DataAccessException {
		CommentVO commentResult = sqlSession.selectOne("com.damtuh.mapper.MemberMapper.productCommentConfirm",
				deliveryId);
		return commentResult;
	}

}
