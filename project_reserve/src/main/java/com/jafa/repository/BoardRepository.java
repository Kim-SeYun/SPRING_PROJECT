package com.jafa.repository;

import java.util.List;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;

public interface BoardRepository {
	
	// 총 게시물 수
		int getTotalCount();
		
		// 게시물 목록
		List<BoardVO> list(Criteria criteria);
		
		// 상세페이지 
		BoardVO detail(Long bno);

}
