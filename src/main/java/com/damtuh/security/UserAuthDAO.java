package com.damtuh.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userAuthDAO")
public class UserAuthDAO {

	@Autowired
	private SqlSession sqlSession;

	public CustomUserDetails getUserById(String username) {
		return sqlSession.selectOne("com.damtuh.mapper.MemberMapper.selectUserById", username);
	}

}
