package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jafa.common.HotelFileUpload;
import com.jafa.domain.HotelAttachVO;
import com.jafa.domain.HotelVO;
import com.jafa.repository.HotelAttachRepository;
import com.jafa.repository.HotelRepository;

@Service
public class HotelService {
	
	@Autowired
	HotelRepository hotelRepository;
	
	@Autowired
	HotelAttachRepository hotelAttachRepository;
	
	@Autowired
	HotelFileUpload hotelFileUpload;
	
	
	@Transactional
	public void write(HotelVO vo, MultipartFile[] multipartFiles) {
		hotelRepository.write(vo);
		List<HotelAttachVO> attachList = hotelFileUpload.getAttachVOAndUpload(vo.getBno(),vo.getCategory(), multipartFiles);
		System.out.println(attachList);
		if(!attachList.isEmpty()) {
			hotelAttachRepository.write(attachList);
			hotelRepository.updateAttachFileCnt(vo.getBno());
		}
	}
	
	public HotelVO detail(Long bno) {
		return hotelRepository.detail(bno);
	}
	


}
