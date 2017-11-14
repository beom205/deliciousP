package com.delip.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	MemberService mService;

	@GetMapping("/join")
	public void MemberJoin() {

	}

	@GetMapping("/sample")
	public void sample() {

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

	// @PostMapping("/join")
	// public String registerPost(Member member, RedirectAttributes rttr) {
	//
	// rttr.addFlashAttribute("result", "success");
	//
	// return "redirect:/member/join";
	// }

	// 회원가입
	@PostMapping("/join")
	public String registerPost(Member member) {

		mService.register(member);

		return "redirect:/";
	}

	// 로그인
	@PostMapping("/login")
	public void loginPost(Member member, Boolean rememberId, Boolean rememberMe, Model model) {
		log.info("" + rememberId);
		log.info("" + rememberMe);
		log.info("사용자 :" + mService.getMemberIdAndPw(member));

		model.addAttribute("uno", mService.getMemberIdAndPw(member));
		model.addAttribute("rememberId", rememberId);
		model.addAttribute("remember", rememberMe);

		// return "redirect:/";
	}
	
}
