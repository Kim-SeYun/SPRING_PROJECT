package com.jafa.controller;

import java.io.File;
import java.io.IOException;
import java.net.FileNameMap;
import java.net.URLConnection;

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

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.repository.BoardRepository;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardRepository repository;
	
	@GetMapping("/list")
	public String list(@ModelAttribute("cri") Criteria criteria, Model model,Long bno) {
		model.addAttribute("p", new Pagination(criteria, repository.getTotalCount()));
		model.addAttribute("list", repository.list(criteria));
		return "board/list";
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	@PostMapping("/write")
	public String write(BoardVO vo) {
		repository.write(vo);
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(Long bno) {
	    repository.remove(bno);
	    return "redirect:/board/list";
	}
	

		
	

}
