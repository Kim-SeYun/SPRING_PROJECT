package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.AuthListDTO;
import com.jafa.domain.AuthVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.HotelAttachVO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.domain.Pagination;
import com.jafa.repository.HotelRepository;
import com.jafa.service.HotelAttachService;
import com.jafa.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService; 
	
	@Autowired
	HotelRepository hotelRepository;
	
	@Autowired
	HotelAttachService hotelAttachService;
	
	@GetMapping("/all")
	public void doAll() {
		log.info("모두 접근 허용");
	}
	
	@PreAuthorize("isAuthenticated()") // 인증된 사용자 
	@GetMapping("/mypage")
	public String myPage(Authentication  auth, Model model, @ModelAttribute("cri") Criteria criteria, @PathVariable(required = false) String category) {
		log.info("로그인한 사용자만 접근 가능");
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO memberVO = principal.getMemberVO();
		model.addAttribute("memberInfo", memberVO);
		model.addAttribute("list", hotelRepository.list(criteria));
		List<HotelAttachVO> attachList = hotelAttachService.listAll(category);
		model.addAttribute("attachList", attachList);
		return "member/mypage";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
	@GetMapping("/admin")
	public void doAdmin(Model model) {
		log.info("관리자만 접근가능");
		List<MemberVO> memberList = memberService.memberList();
		model.addAttribute("list", memberList);
		model.addAttribute("mType", MemberType.values());
	}
	
	@GetMapping("/accessError")
	public void accessError() {
		log.info("접근이 거부됨.");
		// member/accessError.jsp 생성
	}
	
	// 로그인 페이지 
	@RequestMapping("/login")
	public String login(Authentication authentication, RedirectAttributes rttr) {
		log.info("로그인 페이지");
		if(authentication!=null && authentication.isAuthenticated()) { // 인증된 사용자가 있을 때 
			rttr.addFlashAttribute("loginOn", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}
		return "/member/login";
	}
	
	@RequestMapping("/clogin")
	public String clogin(Authentication authentication, RedirectAttributes rttr) {
		log.info("로그인 페이지");
		if(authentication!=null && authentication.isAuthenticated()) { // 인증된 사용자가 있을 때 
			rttr.addFlashAttribute("loginOn", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}
		return "/member/clogin";
	}
	
	// 회원가입폼
	@GetMapping("/join")
	public void joinForm() {
		
	}
		
	// 회원가입처리
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) {
		memberService.join(vo);
		return "redirect:/";
	}
	
		
	// 회원등급변경 
	@PreAuthorize("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
	@PostMapping("/updateMemberType")
	public String updateMemberType(AuthListDTO authListDTO, RedirectAttributes rttr) {
		log.info(authListDTO.getAuthList());
		List<AuthVO> authList = authListDTO.getAuthList();
		for(AuthVO vo : authList) {
			if(vo.getMemberId()!=null&&vo.getMemberType()!=null){
				memberService.updateMemberType(vo);
			}
		}
		rttr.addFlashAttribute("updateMember", "등급변경");
		return "redirect:/member/admin";
	}

}
