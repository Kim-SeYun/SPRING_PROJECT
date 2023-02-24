package com.jafa.repository;

import java.util.List;

import com.jafa.domain.MemberVO;

public interface MemberRepository {
	
	void save(MemberVO vo);
	
	// 로그인 체크 
	MemberVO read(String memberId);

	List<MemberVO> memberList();
}
