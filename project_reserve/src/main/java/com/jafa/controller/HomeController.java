package com.jafa.controller;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jafa.domain.AttachVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.HotelAttachVO;
import com.jafa.domain.HotelVO;
import com.jafa.repository.HotelRepository;
import com.jafa.repository.ReserveRepository;
import com.jafa.service.AttachService;
import com.jafa.service.EventService;
import com.jafa.service.HotelAttachService;

@Controller
public class HomeController {

	@Autowired
	HotelRepository hotelRepository;
	
	@Autowired
	HotelAttachService hotelAttachService;
	
	@Autowired
	ReserveRepository reserveRepository; 
	
	@Autowired
	EventService eventService;
	
	@Autowired
	AttachService attachService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<AttachVO> eventAttach = attachService.listAll();
		System.out.println(eventAttach);
		model.addAttribute("eventAttach", eventAttach);
		return "index";
	}
	
	
	@GetMapping(value = {"/list", "/list/{category}"})
	public String list(Criteria criteria,  Model model, @PathVariable(required = false) String category) {
		
		List<Long> unreservableRooms = new ArrayList<Long>();
		// 예약 불가능한 객실 조회
		if(criteria.getCheckinDate()!=null || criteria.getCheckoutDate()!=null) {
			unreservableRooms.addAll(reserveRepository.searchUneservableRooms(criteria));
			criteria.setUnreservableRooms(unreservableRooms);
		}
		
		criteria.setCategory(category);
		List<HotelVO> list = hotelRepository.list(criteria);
		model.addAttribute("list", list);
		
		// 예약 가능한 객실이 있는 호텔 번호 수집 
		List<Long> availabBno = list.stream().map(e-> e.getBno())
				.distinct()
				.collect(Collectors.toList());
		criteria.setReservableBno(availabBno);
		
		// 예약 가능한 객실이 있는 호텔번호를 전달하여 리스트 조회 
		List<HotelAttachVO> attachList = hotelAttachService.serachConditionList(criteria);
		model.addAttribute("attachList", attachList);
		
		LocalDate today = LocalDate.now();
		LocalDate tomorrow = today.plusDays(1);
		model.addAttribute("today", today);
		model.addAttribute("tomorrow", tomorrow);
		
//		System.out.println(criteria);
		System.out.println(attachList);
		
		return "hotel/list";
		
	}

}
