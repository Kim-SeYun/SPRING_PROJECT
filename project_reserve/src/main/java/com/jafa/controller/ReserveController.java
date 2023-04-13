package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jafa.domain.RoomVO;
import com.jafa.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	ReserveService reserveService;

	
	@GetMapping("/list")
	public String list(Model model, @RequestParam String checkinDate, @RequestParam String checkoutDate, @RequestParam Long room_id) {
		
		RoomVO vo = reserveService.list(room_id);

		model.addAttribute("reserve", vo);
		model.addAttribute("checkinDate", checkinDate);
		model.addAttribute("checkoutDate", checkoutDate);
		
		

		return "hotel/reserve";
	}
	

	

		
	

}
