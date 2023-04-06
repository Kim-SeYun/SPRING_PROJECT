package com.jafa.repository;

import com.jafa.domain.RoomVO;

public interface RoomRepository {
		
	RoomVO list(Long bno);
	
	void updateAttachFileCnt(Long room_id);
	
	void addRoom(RoomVO vo);
	
	
	
	
}
