package com.damtuh.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.damtuh.mapper.MemberMapper;
import com.damtuh.mapper.SupportMapper;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.support.notice.vo.NoticeBoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository("MemberDAO")
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
	public void join(MemberVO vo) {
		MemberVO result = sqlSession.selectOne("com.damtuh.mapper.MemberMapper.join", vo);
	}

}
