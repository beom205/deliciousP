package com.delip.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.delip.service.DetailService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/list/*")//list 시작하는 모든 것을 받겠다
public class DetailController {
   
      @Autowired
      private DetailService service;
      
      //가게 정보 출력
      @GetMapping("/detail")
      public void showDetail(@RequestParam(name="rno") int rno,Model model) {
         model.addAttribute("detail",service.get(rno));
      }
      
      // 리턴값이 void 경우에는 현재 해당하는 jsp 파일을 실행하게 됨
      // 등록
      @GetMapping("/register")
      public void registerGET() {
         
      }
      // 수정
      @GetMapping("/modify")
      public void modify(int rno, Model model) {
         model.addAttribute(service.get(rno));
      }
      
      // 삭제
      @GetMapping("/remove")
      public String remove(@RequestParam(name="rno") int rno, RedirectAttributes red) {
         
         service.delete(rno);
         
         red.addFlashAttribute("msg","ok");
         
         return "/list/listall";
         
      }
      
}