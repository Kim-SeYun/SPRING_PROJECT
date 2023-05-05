package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.AttachVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.HotelAttachVO;
import com.jafa.repository.HotelAttachRepository;

@Service
public class HotelAttachService {
	
	@Autowired
	HotelAttachRepository hotelAttachRepository;
	
	public List<HotelAttachVO> list(Long bno){
		return hotelAttachRepository.list(bno);
	}
	
	public List<HotelAttachVO> listAll(String category){
		return hotelAttachRepository.listAll(category);
	}
	
	public List<HotelAttachVO> serachConditionList(Criteria criteria){
		return hotelAttachRepository.serachConditionList(criteria);
	}
	

}
