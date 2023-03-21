package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.ReplyVO;
import com.jafa.repository.ReplyRepository;

@Service
public class ReplyService {
	
	@Autowired
	ReplyRepository replyRepository;
	
	public List<ReplyVO> list(Long bno){
		return replyRepository.list(bno);
	}
	
	public void writeReply(ReplyVO vo) {
		replyRepository.writeReply(vo);
	}

}
