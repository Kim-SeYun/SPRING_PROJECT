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
	
	public boolean reserve(ReserveVO vo) {
		
		// 예약여부 확인
		String test = reserveRepository.isAvailable(vo.getCheckin(),vo.getRoom_id());
		System.out.println("예약여부 확인 : "+test);
		;
		// 예약
		if(Boolean.parseBoolean(test)) {
			reserveRepository.reserve(vo);
			return true; 
		} else {
			// 예약실패
			return false;
		}
	}
	
	

}
