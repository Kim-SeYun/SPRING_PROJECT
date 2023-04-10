package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.RoomAttachVO;

public interface RoomAttachRepository {
	
	void write(@Param("roomAttach") List<RoomAttachVO> roomAttach);
	
	List<RoomAttachVO> list(Long bno);
	
}
