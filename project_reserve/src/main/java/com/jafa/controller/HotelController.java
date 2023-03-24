package com.jafa.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.HotelVO;
import com.jafa.service.AttachService;
import com.jafa.service.HotelService;

@Controller
@RequestMapping("/hotel")
public class HotelController {

	@Autowired
	HotelService hotelService;
	
	@Autowired
	AttachService attachService;
	
	@GetMapping("/write")
	public String write() {
		return "hotel/write";
	}
	
	@PostMapping("/write")
	public String wrtie(HotelVO vo, RedirectAttributes rttr,
			String category,
			@RequestParam("attachFile") MultipartFile[] multipartFiles){
		hotelService.write(vo, multipartFiles);
		return "redirect:/list/"+category;
	}
	

}
