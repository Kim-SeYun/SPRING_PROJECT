package com.jafa.config;

import java.io.IOException;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.jafa.domain.AttachVO;
import com.jafa.domain.BoardVO;
import com.jafa.domain.EventVO;
import com.jafa.domain.HotelAttachVO;
import com.jafa.domain.HotelVO;
import com.jafa.domain.InquiryVO;
import com.jafa.domain.MemberVO;
import com.jafa.domain.ReplyVO;
import com.jafa.domain.RoomAttachVO;
import com.jafa.domain.RoomVO;

@Configuration
@MapperScan("com.jafa.repository")
@PropertySource(value = "classpath:database/oracle.properties")
public class RootConfig {
	
	@Value("${db.driver}")
	private String driverClass;
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String username;
	@Value("${db.password}")
	private String password;
	
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource dataSource = new DataSource();
		dataSource.setDriverClassName(driverClass);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory() throws IOException {
		SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mappers/**/*Mapper.xml"));
		factory.setTypeAliases(MemberVO.class, BoardVO.class, EventVO.class, AttachVO.class, HotelVO.class, InquiryVO.class, ReplyVO.class, HotelAttachVO.class, RoomVO.class, RoomAttachVO.class);
		return factory;
	}
	
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory().getObject());
	}
	
	// MessageSource 설정
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasenames("classpath:message/label");
		messageSource.setDefaultEncoding("utf-8");
		return messageSource;
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	// 파일업로드 설정 
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("utf-8");
		multipartResolver.setMaxUploadSize(-1);
		return multipartResolver;
	}
	
}