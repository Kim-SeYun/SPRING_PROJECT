package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.ReserveVO;
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
	public String list(Model model, @RequestParam(required = false) String checkinDate, @RequestParam(required = false) String checkoutDate, @RequestParam(required = false) Long room_id) {
		
		RoomVO vo = reserveService.list(room_id);

		model.addAttribute("reserve", vo);
		model.addAttribute("checkinDate", checkinDate);
		model.addAttribute("checkoutDate", checkoutDate);

		return "hotel/reserve";
	}
	
	@PostMapping("/reserve")
	public String reserve(ReserveVO vo, String category, RedirectAttributes rttr) {
		boolean reserve = reserveService.reserve(vo);
		System.out.println("컨트롤러 예약성공여부: " + reserve);
		if(reserve) {
			// 예약성공
			return "redirect:/";
		} else {
			System.out.println(category);
			rttr.addFlashAttribute("reservFail", "예약실패");
			//예약실패 
			return "redirect:/list/"+category;
		}
	}
	

	

		
	

}
