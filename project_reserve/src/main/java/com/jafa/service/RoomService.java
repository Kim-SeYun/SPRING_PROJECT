package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jafa.common.RoomFileUploadUtils;
import com.jafa.domain.RoomAttachVO;
import com.jafa.domain.RoomVO;
import com.jafa.repository.RoomAttachRepository;
import com.jafa.repository.RoomRepository;

@Service
public class RoomService {
	
	@Autowired
	RoomRepository roomRepository;
	
	@Autowired
	RoomAttachRepository roomAttachRepository;
	
	@Autowired
	RoomFileUploadUtils roomFileUploadUtils;
	
	public List<RoomVO> roomList(Long bno){
		return roomRepository.roomList(bno);
	}
	
	public void addRoom(RoomVO vo, MultipartFile[] multipartFiles) {
		roomRepository.addRoom(vo);
		List<RoomAttachVO> roomAttach = roomFileUploadUtils.getAttachVOAndUpload(vo.getRoom_id(), multipartFiles);
		if(!roomAttach.isEmpty()) {
			roomAttachRepository.write(roomAttach);
			roomRepository.updateAttachFileCnt(vo.getRoom_id());
		}
	}
	
	

}
