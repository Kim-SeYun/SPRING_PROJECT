package com.jafa.repository;

import java.util.List;

import com.jafa.domain.Criteria;
import com.jafa.domain.HotelVO;

public interface HotelRepository {
		
	// 게시물 목록
	List<HotelVO> list(Criteria criteria);
	
	int getTotalCount(Criteria criteria);
	
	void write(HotelVO vo);
	
	void updateAttachFileCnt(Long bno);
		
	HotelVO detail(Long bno);
	
	
}
