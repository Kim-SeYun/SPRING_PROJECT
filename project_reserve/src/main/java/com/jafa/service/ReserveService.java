package com.jafa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.ReserveVO;
import com.jafa.domain.RoomVO;
import com.jafa.repository.ReserveRepository;

@Service
public class ReserveService {
	
	@Autowired
	ReserveRepository reserveRepository;
	
	public RoomVO list(Long room_id){
		return reserveRepository.list(room_id);
	}
	
	public void reserve(ReserveVO vo) {
		reserveRepository.reserve(vo);
	}
	
	

}
