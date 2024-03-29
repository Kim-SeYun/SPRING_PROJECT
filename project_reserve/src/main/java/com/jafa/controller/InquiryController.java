package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.InquiryVO;
import com.jafa.domain.ReplyVO;
import com.jafa.service.InquiryService;
import com.jafa.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/inquiry")
@Log4j
public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", inquiryService.list());
		return "inquiry/list";
	}
	
	@GetMapping("/detail")
	public void detail(Long bno, Model model) {
		InquiryVO vo = inquiryService.detail(bno);
		model.addAttribute("i", vo);
		List<ReplyVO> replyList = replyService.list(bno);
		model.addAttribute("replyList", replyList);
	}
	
	@PostMapping("/writeReply")
	public String writeReply(ReplyVO replyVO, RedirectAttributes rttr) {
		replyService.writeReply(replyVO);
		rttr.addAttribute("bno", replyVO.getBno());
		return "redirect:/inquiry/detail";
	}
	
	@PostMapping("/removeReply")
	public String removeReply(Long rno, RedirectAttributes rttr, ReplyVO replyVO) {
		replyService.removeReply(rno);
		rttr.addAttribute("bno", replyVO.getBno());
		return "redirect:/inquiry/detail";
	}
	
	@PostMapping("/remove")
	public String remove(Long bno) {
		inquiryService.remove(bno);
		return "redirect:/inquiry/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "inquiry/write";
	}
	
	@PostMapping("/write")
	public String write(InquiryVO vo) {
		inquiryService.write(vo);
		return "redirect:/inquiry/list";
	}
	
	@GetMapping("/modify")
	public void modify(Long bno, Model model) {
		InquiryVO vo = inquiryService.detail(bno);
		model.addAttribute("i", vo);
	}
	
	@PostMapping("/modify")
	public String modify(InquiryVO vo) {
		inquiryService.modify(vo);
		return "redirect:/inquiry/list";
	}
	

}
