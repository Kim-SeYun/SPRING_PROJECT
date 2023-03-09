package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jafa.common.FileUploadUtils;
import com.jafa.domain.AttachVO;
import com.jafa.domain.EventVO;
import com.jafa.repository.AttachRepository;
import com.jafa.repository.EventRepository;

@Service
public class EventService {
	
	@Autowired
	EventRepository eventRepository;
	
	@Autowired
	AttachRepository attachRepository;
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
	public List<EventVO> list(){
		return eventRepository.list(); 
	}
	
	@Transactional
	public void write(EventVO vo, MultipartFile[] multipartFiles) {
		eventRepository.write(vo);
		List<AttachVO> attachList = fileUploadUtils.getAttachVOAndUpload(vo.getBno(), multipartFiles);
		if(!attachList.isEmpty()) {
			attachRepository.save(attachList);
		}
	}
	

}
