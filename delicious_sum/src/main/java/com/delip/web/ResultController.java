package com.delip.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.ibatis.annotations.Param;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
	@GetMapping(value="/display", produces="image/jpeg") //produces mytype을 안에 값대로 주겠다.
	@ResponseBody
	public byte[] display(String name) { // 브라우저에 이미지데이터를 바로 전달
		
		try {
			FileInputStream in = new FileInputStream("C:\\zzz\\" + name);
			ByteArrayOutputStream bas = new ByteArrayOutputStream();
			
			FileCopyUtils.copy(in, bas);
			
			return bas.toByteArray();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
}
