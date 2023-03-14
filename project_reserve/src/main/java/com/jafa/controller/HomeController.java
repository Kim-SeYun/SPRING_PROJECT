package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.repository.HotelRepository;

@Controller
public class HomeController {

	@Autowired
	HotelRepository hotelRepository;
	
	@GetMapping("/")
	public String home(Model model) {
		return "index";
	}
	
	
	@GetMapping(value = {"/list", "/list/{category}"})
	public String list(@ModelAttribute("cri") Criteria criteria, Model model, @PathVariable(required = false) String category) {
		criteria.setCategory(category);
		Model list = model.addAttribute("list", hotelRepository.list(criteria));
		System.out.println(list);
		
		model.addAttribute("p", new Pagination(criteria, hotelRepository.getTotalCount(criteria)));
		return "hotel/list";
		
	}

}
