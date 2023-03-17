package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.InquiryVO;
import com.jafa.repository.InquiryRepository;

@Service
public class InquiryService {
	
	@Autowired
	InquiryRepository inquiryRepository;
	
	public List<InquiryVO> list(){
		return inquiryRepository.list();
	}
	
	public InquiryVO detail(Long bno) {
		return inquiryRepository.detail(bno);
	}
	
	public void remove(Long bno) {
		inquiryRepository.remove(bno);
	}
	
	public void write(InquiryVO vo) {
		inquiryRepository.write(vo);
	}
	
	public void modify(InquiryVO vo) {
		inquiryRepository.modify(vo);
	}

}
