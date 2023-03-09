package com.jafa.repository;

import java.util.List;

import com.jafa.domain.EventVO;

public interface EventRepository {
	
	List<EventVO> list();
	
	void write(EventVO vo);
	
	void updateAttachFileCnt(Long bno);
	
	EventVO detail(Long bno);

}
