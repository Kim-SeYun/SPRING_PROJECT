package com.jafa.repository;

import com.jafa.domain.AuthVO;

public interface AuthRepository {
	
	void save(AuthVO vo);
	
	// 모든 회원등급 삭제
		void remove(String memberId);
}
