package com.damtuh.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.damtuh.member.vo.MemberVO;

public interface MemberDAO {
	
	public int idCheck(String id) throws DataAccessException;

	public void join(MemberVO vo);
}
