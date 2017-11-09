package com.delip.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.delip.domain.Member;
import com.delip.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService s;
	
	@GetMapping("/join")
	public void MemberJoin() {
		
	}
	
	@GetMapping("/login")
	public void MemberLogin() {
		
	}
	
	@GetMapping("/dropout")
	public void MemberLogout() {
		
	}
	
	@GetMapping("/idinquiry")
	public void MemberInquiry() {
		
	}
	
//	@PostMapping("/join")
//	public String registerPost(Member member, RedirectAttributes rttr) {
//		
//		rttr.addFlashAttribute("result", "success");
//		
//		return "redirect:/member/join";
//	}
	// 회원가입
	@PostMapping("/join")
	public void registerPost(@RequestParam(name="userId") String id,@RequestParam(name="userPw") String pw,@RequestParam(name="nickName") String nickName,@RequestParam(name="level") String level) {
		log.info(id);
		log.info(pw);
		log.info(nickName);
		log.info(level);
		Member m = new Member();
		m.setUid(id);
		m.setUpassword(pw);
		m.setUname(nickName);
		m.setUlevel(level);
		s.register(m);
	}
	
	// 로그인
	
}
