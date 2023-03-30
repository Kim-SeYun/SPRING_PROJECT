package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.AttachVO;
import com.jafa.domain.HotelAttachVO;

public interface HotelAttachRepository {
	
	void write(@Param("attachList") List<HotelAttachVO> attachList);
	
	List<HotelAttachVO> list(Long bno);
	
	List<HotelAttachVO> listAll(@Param("category") String category);
}
