package com.jafa.repository;

import com.jafa.domain.ReserveVO;
import com.jafa.domain.RoomVO;

public interface ReserveRepository {
	
	RoomVO list(Long room_id);
	
	void reserve(ReserveVO vo);

}
