package com.delip.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {

	
	@GetMapping(value="/download")
	@ResponseBody
	public ResponseEntity<byte[]> downloadFile(String name) {
		
		ResponseEntity<byte[]> result = null;		
		HttpHeaders headers = new HttpHeaders();
		
		String fileName = name.substring(37);
		
		try {
			
			InputStream in = new FileInputStream("C:\\zzz\\"+name);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			
			IOUtils.copy(in, bos);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		    headers.add("Content-Disposition", "attachment; filename=\""+ 
		        new String(fileName.getBytes(), "ISO-8859-1")+"\""); // utf-8을 빼주면 IE에서 안꺠진다
			
			return new ResponseEntity<byte[]>(bos.toByteArray(), headers, HttpStatus.OK);
					
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@GetMapping("/delFile")
	@ResponseBody
	public String delFile(String name) {
		
		log.info("delFile: " + name);
		
		return "success";
		
	}
	
	@GetMapping("/upload/ex1")
	public void ex1() {

	}

	@GetMapping(value="/display", produces="image/jpeg")
	@ResponseBody
	public byte[] display(String name) {
		try {
			
			FileInputStream in =
					new FileInputStream("C:\\zzz\\" + name);
			
			ByteArrayOutputStream bas =
					new ByteArrayOutputStream();
			
			FileCopyUtils.copy(in, bas);
			
			return bas.toByteArray();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	@PostMapping("/upload/ex1")
	public String ex1Post(MultipartFile f1, Model model) {
		
		log.info("Filename :" + f1.getOriginalFilename());
		log.info("Type :" + f1.getContentType());
		log.info("Size :" + f1.getSize());
		
		String uuid = UUID.randomUUID().toString();
		
		String uploadName = uuid + "_" + f1.getOriginalFilename();
		
		model.addAttribute("uploadName", uploadName);
		
		try {
			OutputStream out = new FileOutputStream("C:\\zzz\\" + uploadName);
			FileCopyUtils.copy(f1.getInputStream(), out);
			
			if(f1.getContentType().startsWith("image")) {
				model.addAttribute("isImage", f1.getContentType().startsWith("image"));
				makeThumbnail(uploadName);
				//thumbnail image
				
			}
			
		} catch (Exception e) {
			log.warning(e.getMessage());
		}
		
		return "/upload/result";
		
	}
	
	
	//리뷰 파일 업로드~~
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
	
    //썸네일 펑션

	private String makeThumbnail(String fileName) throws Exception {

		BufferedImage sourceImg = ImageIO.read(new File("C:\\zzz", fileName));

		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbnailName = "C:\\zzz" + File.separator + "s_" + fileName;  // s_ 는 썸네일이다 라고 알려줌

		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		log.info(thumbnailName);
		return thumbnailName;
	}

}
