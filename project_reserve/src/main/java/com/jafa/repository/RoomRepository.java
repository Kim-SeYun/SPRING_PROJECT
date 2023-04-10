package com.jafa.repository;

import java.util.List;

import com.jafa.domain.RoomVO;

public interface RoomRepository {
		
	List<RoomVO> roomList(Long bno);
	
	void updateAttachFileCnt(Long room_id);
	
	void addRoom(RoomVO vo);
	
	
	
	
}
