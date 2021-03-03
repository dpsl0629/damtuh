package com.damtuh.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {

	@Setter(onMethod_ = {@Autowired})
	private BCryptPasswordEncoder pwencoder;
	
	@Setter(onMethod_ = {@Autowired} )
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		String sql = "insert into tbl_member_auth (userid, auth) values (?,?)";
		
		for (int i = 0; i < 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,  "member" + i);
				pstmt.setString(2,  "ROLE_MEMBER" + i);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) { try {pstmt.close(); } catch (Exception e) {}}
				if(con != null) { try { con.close(); } catch (Exception e) {}}
			}
		}
		
		
	}
	
		
	}
