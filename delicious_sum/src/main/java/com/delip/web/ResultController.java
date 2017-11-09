package com.delip.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delip.domain.Result;
import com.delip.service.ResultService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/list/*")
public class ResultController {

	@Autowired
	private ResultService service;

	@GetMapping("/test")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	@RequestMapping("/ajax")
	@ResponseBody
	public List<Result> list2() {
		return service.getList();		// System.out.println(admin.getAdminId()+admin.getAdminPw());
	}
//	@GetMapping("/test")
//	public void search(@RequestParam(name="search") String search, Model model) {
//		log.info(search);
////		service.getList(search);
//		model.addAttribute("list", service.getList(search));
//	}
//	@RequestMapping("/ajax")
//	@ResponseBody
//	public List<Result> list2(String search) {
//		return service.getList(search);		// System.out.println(admin.getAdminId()+admin.getAdminPw());
//	}

}
