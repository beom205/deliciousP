package com.delip.web;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.delip.domain.Member;
import com.delip.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	MemberService mService;

	@GetMapping("/samplet")
	public void sample() {

	}

	@GetMapping("/dropout")
	public void MemberLogout() {

	}

	@GetMapping("/idinquiry")
	public void MemberInquiry() {

	}

	// 아이티 중복 체크
	@PostMapping("/checkID")
	@ResponseBody
	public Integer checkIDPost(String uid) {
		return mService.checkId(uid);
	}

	// 회원가입
	@GetMapping("/join")
	public void MemberJoin() {

	}

	@PostMapping("/join")
	public String registerPost(Member member) {

		mService.register(member);

		return "redirect:/";
	}

	// 로그인
	@GetMapping("/login")
	public void MemberLogin() {

	}

	@PostMapping("/loginPost")
	public String loginPost(Member vo, Boolean remember, Model model) {

		Member member = mService.getMemberIdAndPw(vo);

		if (member != null) {
			model.addAttribute("member", member.getUid());
			model.addAttribute("remember", remember);
			return "redirect:/";
		}
		model.addAttribute("msg", false);
		return "redirect:/member/login";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logoutGet( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		Object obj = session.getAttribute("login");
		log.info("시작");
//		log.info(session.getAttribute("session").toString());
//		log.info(session.getAttribute("login").toString());
//		log.info(session.getAttribute("").toString());
//		
//		
//		log.info("갖고 있던 세션: " + obj.toString());
		
		
		log.info("" + session.getAttribute("login"));
		log.info("" + WebUtils.getCookie(request, "login"));
		
		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "login");
			
			log.info("갖고 있던 쿠키: " + loginCookie);

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				// log.info("삭제 후 쿠키: " + loginCookie.getValue());
				response.addCookie(loginCookie);
			}
		}
//
//		log.info("삭제 후 세션: " + session.getAttribute("Session"));
		log.info("끝");
		return "redirect:/";

	}

}
