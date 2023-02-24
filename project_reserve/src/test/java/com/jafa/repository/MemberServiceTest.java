package com.jafa.repository;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.jafa.AppTest;
import com.jafa.config.RootConfig;
import com.jafa.config.SecurityConfig;
import com.jafa.config.ServletConfig;
import com.jafa.domain.AuthVO;
import com.jafa.domain.MemberType;
import com.jafa.service.MemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, ServletConfig.class})
@WebAppConfiguration
@Log4j
public class MemberServiceTest extends AppTest{

	@Autowired
	MemberService memberService;

	@Test
	public void test() {
		AuthVO auth = new AuthVO("admin", MemberType.ROLE_ADMIN);
		memberService.updateMemberType(auth);
	}
	
	@Test
	public void test2() {
		AuthVO auth = new AuthVO("mimi", MemberType.ROLE_REGULAR_MEMBER);
		memberService.updateMemberType(auth);
	}

}
