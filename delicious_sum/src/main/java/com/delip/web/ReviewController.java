package com.delip.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.delip.domain.Photo;
import com.delip.domain.ReviewRegister;
import com.delip.service.DetailService;
import com.delip.service.PhotoService;
import com.delip.service.ReviewRegisterService;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/register/*")
public class ReviewController {
	
	@Autowired
	ReviewRegisterService rService;
	
	@Autowired
	PhotoService pService;
	
	@Autowired
	DetailService dService;
	
	@GetMapping("/review")
	public void reviewRegister(int rno, Model model) {
		 model.addAttribute("rno", rno);
	}
	
	@PostMapping("/review")
	@Transactional
	public String reviewRegister(Photo photo, ReviewRegister reviewRegister, MultipartFile file, Model model) {
		
		//UUID(범용 고유 식별자)
		String uuid = UUID.randomUUID()+".jpg";
		
		String uploadName = uuid + "_" + file.getOriginalFilename();
		
		//model.addAttribute("uploadName" , uploadName);
		
		try {
			OutputStream out = new FileOutputStream("C:\\zzz\\" + uploadName); 
			FileCopyUtils.copy(file.getInputStream(), out);
			if(file.getContentType().startsWith("image")) {
				//model.addAttribute("isImage", file.getContentType().startsWith("image"));
				makeThumbnail(uploadName);
			}

			
		}catch(Exception e) {
			log.warning(e.getMessage());
		}
		
		
		photo.setFile_name(uploadName);
		
		log.info(""+ reviewRegister);
		
		rService.reviewRegister(reviewRegister);
		pService.register(photo);
		
		return "redirect:/list/detail";
		
	}
	
	
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
	
	private String makeThumbnail(String fileName)throws Exception{
        
		  BufferedImage sourceImg = 
		      ImageIO.read(new File("C:\\zzz\\", fileName));
		  
		  BufferedImage destImg = 
		      Scalr.resize(sourceImg, 
		          Scalr.Method.AUTOMATIC, 
		          Scalr.Mode.FIT_TO_HEIGHT,100);
		  
		  String thumbnailName = "C:\\zzz\\" + File.separator +"s_"+ fileName; //s_ thumnail인지 구분하기 위해 추가
		  
		  File newFile = new File(thumbnailName);
		  String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		  
		  
		  ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		  log.info(thumbnailName);
		  
		  return thumbnailName;
		} 
	

	
}
