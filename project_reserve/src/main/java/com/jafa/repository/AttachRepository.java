package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.AttachVO;

public interface AttachRepository {
	
	void save(@Param("attachList") List<AttachVO> attachList);
	
	List<AttachVO> list(Long bno);

}
