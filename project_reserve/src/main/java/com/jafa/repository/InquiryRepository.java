package com.jafa.repository;

import java.util.List;

import com.jafa.domain.InquiryVO;

public interface InquiryRepository {
	
	List<InquiryVO> list();
	
	InquiryVO detail(Long bno);
	
	void remove(Long bno);
	
	void write(InquiryVO vo);
	
	void modify(InquiryVO vo);
	
	

}
