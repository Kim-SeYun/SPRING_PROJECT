package com.jafa.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.EventVO;
import com.jafa.domain.FileType;
import com.jafa.service.EventService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event")
@Log4j
public class EventController {
	
	@Autowired
	EventService eventService;
	
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

}
