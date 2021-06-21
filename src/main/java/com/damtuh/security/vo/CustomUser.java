package com.damtuh.security.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.damtuh.member.vo.MemberVO;

public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private MemberVO member;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getId(), vo.getPw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
				
		this.setMember(vo);
		
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}
	
}
