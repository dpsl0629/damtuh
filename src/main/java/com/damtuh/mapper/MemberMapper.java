package com.damtuh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.damtuh.member.vo.MemberVO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;



public interface MemberMapper {
	
	public int idCheck(String id);
	
	public void join(MemberVO numberId);
}
