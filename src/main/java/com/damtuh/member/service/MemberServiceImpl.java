package com.damtuh.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.damtuh.mapper.MemberMapper;
import com.damtuh.mapper.SupportMapper;
import com.damtuh.member.dao.MemberDAO;
import com.damtuh.member.vo.MemberVO;
import com.damtuh.support.notice.dao.SupportDAO;
import com.damtuh.support.notice.service.NoticeBoardServiceImpl;
import com.damtuh.support.notice.vo.NoticeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
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

}
