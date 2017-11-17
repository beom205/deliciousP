package com.delip.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public void list(Model model, String keyword) {
		model.addAttribute("list", service.getList(keyword));
		model.addAttribute("keyword",keyword);
	}
	
	@RequestMapping(value="/ajax", method=RequestMethod.GET)
	@ResponseBody
	public List<Result> moreList(@Param("keyword") String keyword) {
		log.info("keyword["+keyword+"]");
		return service.getList(keyword);	
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
