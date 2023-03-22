package com.jafa.repository;

import java.util.List;

import com.jafa.domain.ReplyVO;

public interface ReplyRepository {
	
	List<ReplyVO> list(Long bno);
	
	void writeReply(ReplyVO vo);
	
	void removeReply(Long bno);

}
