package com.jafa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@Log4j
@ComponentScan("com.jafa.security")
@EnableGlobalMethodSecurity(prePostEnabled = true,securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
//	@Bean
//	public AccessDeniedHandler accessDeniedHandler() {
//		return new MemberAccessDeniedHandler();
//	}
//	MemberAccessDeniedHandler에서 Component 등록해서 필요 X
	
	@Autowired
	AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	AuthenticationFailureHandler authenticationFailureHandler;
	
	@Autowired
	AuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Autowired
	LogoutSuccessHandler logoutSuccessHandler;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	DataSource dataSource;
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository =  new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests()
//		.antMatchers("/member/all").access("permitAll")
//		.antMatchers("/member/mypage").access("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
//		.antMatchers("/member/admin").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')");
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
       
		http.formLogin()
        .loginPage("/member/login") 
        .loginProcessingUrl("/member/login")
		.failureHandler(authenticationFailureHandler) // 로그인 실패 핸들러
        .successHandler(authenticationSuccessHandler); // 로그인 성공 핸들러 
        // /login으로 요청하면 스프링시큐리티가 제공하는 로그인 페이지로 이동
        
		http.rememberMe()
		.key("mimi") // 인증받은 사용자의 정보로 token을 생성하는데 사용되는 임의의 key값 설정 
		.tokenRepository(persistentTokenRepository())
		.rememberMeParameter("remember-me") // 자동로그인 체크박스의 name속성 지정 : 기본값
		.tokenValiditySeconds(86400); // token만료시간 설정
		
		http.logout()
		.invalidateHttpSession(true) 
		.logoutUrl("/member/logout") // 로그아웃 처리 URL 
//		.logoutSuccessUrl("/"); // 로그아웃 성공시 요청 URL
		.logoutSuccessHandler(logoutSuccessHandler) // 로그아웃 성공 핸들러
		.deleteCookies("remember-me","JSESSION_ID");
        
        http.exceptionHandling()
        	.accessDeniedHandler(accessDeniedHandler);
        
        http.logout()
		//.invalidateHttpSession(true) 
		.logoutUrl("/member/logout") // 로그아웃 처리 URL
		.logoutSuccessHandler(logoutSuccessHandler);
		//.logoutSuccessUrl("/"); // 로그아웃 성공시 요청 페이지
	}
	
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService)
		.passwordEncoder(passwordEncoder());
    }

}
