package com.delip.web;

import java.io.FileOutputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {
	
	
	@GetMapping("/upload/file")
	public void file() {
		
	}
	//파일받는 메소드 
    @PostMapping("/upload/file")
    public void filePost(MultipartFile f1) {
         log.info(f1.getOriginalFilename());
         log.info(f1.getContentType());
         log.info(""+f1.getSize());
         
         try {
             OutputStream out =
                       new FileOutputStream("C:\\zzz\\aaa.jpg");
             FileCopyUtils.copy(f1.getInputStream(), out);
         }catch(Exception e) {
             log.warning(e.getMessage());
         }

    }

	

}
