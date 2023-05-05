package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.Criteria;
import com.jafa.domain.ReserveVO;
import com.jafa.domain.RoomVO;

public interface ReserveRepository {
	
	RoomVO list(Long room_id);
	
	void reserve(ReserveVO vo);

	String isAvailable(@Param("checkin") String checkin, @Param("room_id") Long room_id);

	List<Long> searchUneservableRooms(Criteria criteria);
}
