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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.AttachVO;
import com.jafa.domain.EventVO;
import com.jafa.domain.FileType;
import com.jafa.service.AttachService;
import com.jafa.service.EventService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event")
@Log4j
public class EventController {
	
	@Autowired
	EventService eventService;
	
	@Autowired
	AttachService attachService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", eventService.list());
		return "event/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "event/write";
	}
	
	@PostMapping("/write")
	public String wrtie(EventVO vo, RedirectAttributes rttr, @RequestParam("attachFile") MultipartFile[] multipartFiles){
		eventService.write(vo, multipartFiles);
		return "redirect:/event/list";
	}
	
	@GetMapping("/detail")
	public void detail(Long bno, Model model) {
		EventVO vo = eventService.detail(bno);
		model.addAttribute("b", vo);
		if(vo.getAttachFileCnt()>0) {
			List<AttachVO> attachList = attachService.list(bno);
			model.addAttribute("attachList", attachList);
		}
	}
	
	// 이미지 나타내기
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
	
	@PostMapping("/remove")
	public String remove(Long bno) {
		eventService.remove(bno);
		return "redirect:/event/list";
	}
	
	@GetMapping("/modify")
	public void modify(Long bno, Model model) {
		EventVO vo = eventService.detail(bno);
		model.addAttribute("b", vo);
		if(vo.getAttachFileCnt()>0) {
			List<AttachVO> attachList = attachService.list(bno);
			model.addAttribute("attachList", attachList);
		}
	}
	
	@PostMapping("/modify")
	public String modify(EventVO vo, RedirectAttributes rttr, @RequestParam(value = "delFileList") List<Long> delFileList, 
			@RequestParam(value = "attachFile") MultipartFile[] multipartFiles) {
		eventService.modify(vo, delFileList, multipartFiles);
		return "redirect:/event/list";
	}

}
