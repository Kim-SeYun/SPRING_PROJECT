package com.jafa.controller;


import java.io.File;
import java.io.IOException;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.HotelAttachVO;
import com.jafa.domain.HotelVO;
import com.jafa.domain.RoomAttachVO;
import com.jafa.domain.RoomVO;
import com.jafa.service.HotelAttachService;
import com.jafa.service.HotelService;
import com.jafa.service.RoomAttachService;
import com.jafa.service.RoomService;

@Controller
@RequestMapping("/hotel")
public class HotelController {

	@Autowired
	HotelService hotelService;
	
	@Autowired
	HotelAttachService hotelAttachService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	RoomAttachService roomAttachService;
	
	@GetMapping("/write")
	public String write() {
		return "hotel/write";
	}
	
	@PostMapping("/write")
	public String wrtie(HotelVO vo, RedirectAttributes rttr,
			@RequestParam String category,
			@RequestParam("attachFile") MultipartFile[] multipartFiles){
		hotelService.write(vo, multipartFiles);
		return "redirect:/list/"+category;
	}
	
	@GetMapping("/imgDisplay")
	public ResponseEntity<byte[]>  imgDisplay(String filePath, String fileName) throws IOException {
		File file = new File(filePath);
		if(!file.exists()) {
			return new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		HttpHeaders headers = new HttpHeaders();
		FileNameMap fileNameMap = URLConnection.getFileNameMap();
		headers.add("Content-Type", fileNameMap.getContentTypeFor(fileName));
		
		return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("bno") Long bno, Model model) {
		HotelVO vo = hotelService.detail(bno); // 하나의 호텔
		model.addAttribute("h", vo);
		if(vo.getAttachFileCnt()>0) {
			List<HotelAttachVO> attachList = hotelAttachService.list(bno);
			model.addAttribute("attachList", attachList);
		}
		List<RoomVO> roomList = roomService.roomList(bno);
		    model.addAttribute("roomList", roomList);
		    if (roomList.size() > 0 && roomList.get(0).getAttachFileCnt() > 0) {
		        List<RoomAttachVO> roomAttach = roomAttachService.list(bno);
		        model.addAttribute("roomAttach", roomAttach);
		}
	}
	
	@GetMapping("/addRoom")
	public String addRoom() {
		return "hotel/addRoom";
	}
	
	@PostMapping("/addRoom")
	public String addRoom(RoomVO vo, Model model,
			@RequestParam Long bno,
			@RequestParam("attachFile") MultipartFile[] multipartFiles){

		roomService.addRoom(vo, multipartFiles);
		return "redirect:/hotel/detail?bno="+bno;
	}
	
	

}
