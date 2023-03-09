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
import com.jafa.domain.EventVO;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, ServletConfig.class})
@WebAppConfiguration
@Log4j
public class EventRepositoryTest extends AppTest{

	@Autowired
	EventRepository eventRepository;
	
	@Test
	public void test() {
		EventVO vo = EventVO.builder()
				.title("aa")
				.content("dd")
				.writer("dd")
				.fileName("ddd")
				.build();
		eventRepository.write(vo);
	
	}
	
	
}
