package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.RoomAttachVO;
import com.jafa.repository.RoomAttachRepository;

@Service
public class RoomAttachService {
	
	@Autowired
	RoomAttachRepository roomAttachRepository;
	
	public List<RoomAttachVO> list(Long room_id){
		return roomAttachRepository.list(room_id);
	}
	
	
	

}
