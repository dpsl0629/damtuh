package com.damtuh.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damtuh.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	// 아이디 중복검사
	@Test
	public void testRead() {
		MemberVO vo = mapper.read("dpsl");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
	
}
