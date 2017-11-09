package com.delip.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;

@Log
@Controller
public class MainContorller {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String sample() {
		log.info("Welcome Main");
		return "main";
	}
	
	
}
