package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.AttachVO;
import com.jafa.repository.HotelAttachRepository;

@Service
public class HotelAttachService {
	
	@Autowired
	HotelAttachRepository hotelAttachRepository;
	
	public List<AttachVO> list(Long bno){
		return hotelAttachRepository.list(bno);
	}
	
	public List<AttachVO> listAll(){
		return hotelAttachRepository.listAll();
	}
	

}
