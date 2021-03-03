package com.damtuh.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.damtuh.member.vo.MemberVO;

public interface MemberService {
	
	public int idCheck(String id);
	
	public void join(MemberVO vo);
}
