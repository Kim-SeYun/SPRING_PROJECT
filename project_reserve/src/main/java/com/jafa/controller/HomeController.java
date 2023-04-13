package com.jafa.controller;


import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.jafa.domain.Criteria;
import com.jafa.domain.HotelAttachVO;
import com.jafa.domain.Pagination;
import com.jafa.repository.HotelRepository;
import com.jafa.service.HotelAttachService;

@Controller
public class HomeController {

	@Autowired
	HotelRepository hotelRepository;
	
	@Autowired
	HotelAttachService hotelAttachService;
	
	@GetMapping("/")
	public String home(Model model) {
		return "index";
	}
	
	
	@GetMapping(value = {"/list", "/list/{category}"})
	public String list(@ModelAttribute("cri") Criteria criteria, Model model, @PathVariable(required = false) String category) {
		criteria.setCategory(category);
		model.addAttribute("list", hotelRepository.list(criteria));
		model.addAttribute("p", new Pagination(criteria, hotelRepository.getTotalCount(criteria)));
		List<HotelAttachVO> attachList = hotelAttachService.listAll(category);
		model.addAttribute("attachList", attachList);
		
		LocalDate today = LocalDate.now();
		LocalDate tomorrow = today.plusDays(1);

		model.addAttribute("today", today);
		model.addAttribute("tomorrow", tomorrow);
		return "hotel/list";
		
	}
	

}
