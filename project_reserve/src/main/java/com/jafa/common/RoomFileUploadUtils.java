package com.jafa.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.jafa.domain.AttachVO;
import com.jafa.domain.FileType;
import com.jafa.domain.RoomAttachVO;

@Component
public class RoomFileUploadUtils {

private final static String BOARD_UPLOAD_FOLDER = "c:/reserve/room";
	
	public List<RoomAttachVO> getAttachVOAndUpload(Long room_id, MultipartFile[] multipartFiles){
		List<RoomAttachVO> roomAttach = new ArrayList<RoomAttachVO>();
		for(MultipartFile mf : multipartFiles) {
			if(!mf.isEmpty()) { // MultipartFile객체에 파일정보가 있을 때 
				RoomAttachVO attachVo = RoomAttachVO.builder()
						.room_id(room_id)
						.fileName(mf.getOriginalFilename())
						.filePath(getFilePath(room_id,mf.getOriginalFilename()))
						.fileType(getFileType(mf.getContentType()))
						.build();
				roomAttach.add(attachVo);
				
				// 파일업로드 
				File folder = new File(BOARD_UPLOAD_FOLDER+"/"+room_id);
				File file = new File(attachVo.getFilePath());
				if(!folder.exists()) {
					folder.mkdirs();
				}
				try {
					mf.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return roomAttach; 
	}
	
	// 업로드한 파일 경로 
	private String getFilePath(Long bno, String originalFilename) {
		String uuid = UUID.randomUUID().toString();
		return BOARD_UPLOAD_FOLDER+"/"+bno+"/"+uuid+"_"+originalFilename;
	}

	// 파일 타입 결정
	private FileType getFileType(String contentType) {
		if(contentType.startsWith("image")) return FileType.IMAGE; 
		else return FileType.OTHER; 
	}

	public void deleteAllFile(Long bno) {
		File delFolder = new File(BOARD_UPLOAD_FOLDER+"/"+bno);
		if(delFolder.exists()) {
			File[] listFiles = delFolder.listFiles();
			for(File f : listFiles) {
				f.delete(); // 모든파일 삭제 
			}
			delFolder.delete(); // 폴더 삭제 
		}
	}
}
