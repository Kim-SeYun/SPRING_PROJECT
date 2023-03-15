package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.service.InquiryService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/inquiry")
@Log4j
public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", inquiryService.list());
		return "inquiry/list";
	}
	

}
