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
import com.jafa.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, ServletConfig.class})
@WebAppConfiguration
@Log4j
public class MemberRepositoryTest extends AppTest{

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	AuthRepository authRepository;
	
	@Test
	public void test() {
		MemberVO vo = MemberVO.builder()
				.memberId("mimi")
				.password("1234")
				.email("mimi@naver.com")
				.name("미미")
				.address("대구")
				.birth(1515521)
				.build();
		memberRepository.save(vo);
		AuthVO authVO = AuthVO.builder()
				.memberId(vo.getMemberId())
				.memberType(MemberType.ROLE_ASSOCIATE_MEMBER)
				.ordinal(MemberType.ROLE_ASSOCIATE_MEMBER.ordinal())
				.build();
		authRepository.save(authVO);
	}
	
	@Test
	public void test2() {
		MemberVO read = memberRepository.read("mimi");
		log.info(read);
	}
}
