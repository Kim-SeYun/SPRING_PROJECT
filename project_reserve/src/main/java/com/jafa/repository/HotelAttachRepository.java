package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.AttachVO;
import com.jafa.domain.HotelAttachVO;

public interface HotelAttachRepository {
	
	void save(@Param("attachList") List<HotelAttachVO> attachList);
	
	List<AttachVO> list(Long bno);
	
	List<AttachVO> listAll();
}
