package com.delip.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.delip.domain.Detail;
import com.delip.domain.Photo;
import com.delip.domain.ReviewRegister;
import com.delip.service.DetailService;
import com.delip.service.ReviewRegisterService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/list/*") // list 시작하는 모든 것을 받겠다
public class DetailController {

	@Autowired
	private DetailService service;

	@Autowired
	private ReviewRegisterService rService;

	@GetMapping("resultlist")
	public void goResult() {

	}

	@GetMapping("/register")
	public void registerGET() {

	}

	@PostMapping("/register")
	public String RegisterPost(Photo photo, Detail detail, RedirectAttributes rttr, MultipartFile f1, Model model) {

		log.info(f1.getOriginalFilename());
		log.info(f1.getContentType());
		log.info("" + f1.getSize());

		String uuid = UUID.randomUUID().toString();
		String uploadName = uuid + "_" + f1.getOriginalFilename();
		// String thumbnailName = "";
		try {
			OutputStream out = new FileOutputStream("C:\\zzz\\" +uploadName);
			FileCopyUtils.copy(f1.getInputStream(), out);

			if(f1.getContentType().startsWith("image")) {
				model.addAttribute("isImage", f1.getContentType().startsWith("image"));
				makeThumbnail(uploadName);
			}

		} catch (Exception e) {
			log.warning(e.getMessage());
		}

		log.info("" + detail);
		photo.setFile_name(uploadName);
		
		int registRNO = service.register(detail, photo);
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/list/detail?rno="+registRNO;
	}
	

	private String makeThumbnail(String fileName) throws Exception {
		
		BufferedImage sourceImg = 
			      ImageIO.read(new File("C:\\zzz\\", fileName));
			  
			  int dw = 150, dh = 100;
		      int ow = sourceImg.getWidth(); 
		      int oh = sourceImg.getHeight();
		      int nw = ow; 
		      int nh = (ow * dh) / dw;
		      if(nh > oh) { nw = (oh * dw) / dh; nh = oh; }
		      BufferedImage cropImg = Scalr.crop(sourceImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
			  
		      BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
			  
			  String thumbnailName = "C:\\zzz\\" + File.separator +"s_"+ fileName; //s_ thumnail인지 구분하기 위해 추가
			  
		File newFile = new File(thumbnailName); //
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		log.info(thumbnailName);
		return thumbnailName;
	}

	// 가게 정보 출력
	@GetMapping("/detail")
	public void showDetail(@RequestParam(name = "rno") int rno, Model model) {
		model.addAttribute("detail", service.get(rno));
		model.addAttribute("photo",service.getPhoto(rno));
		// 리뷰를 리스트에 담아a주
        List<ReviewRegister> list = rService.getReviews(rno);       
        for(ReviewRegister rr : list) {
       	 log.info(""+rr);
        }
        model.addAttribute("review",list);
	}

	// 수정
	@GetMapping("/modify")
	public void modifyGET(@RequestParam(name = "rno") int rno, Model model) {

		model.addAttribute(service.get(rno));

	}

	// 수정 -> 실제 수정하는 화면
	@PostMapping("/modify")
	public String modifyPOST(Detail detail, Photo photo, RedirectAttributes rttr, MultipartFile f1) {

		/*log.info(f1.getOriginalFilename());
		log.info(f1.getContentType());
		log.info("" + f1.getSize());*/

		String uuid = UUID.randomUUID().toString();
		String uploadName = uuid + "_" + f1.getOriginalFilename();
		String thumbnailName = "";
		try {
			OutputStream out = new FileOutputStream("C:\\zzz\\" + uploadName);
			FileCopyUtils.copy(f1.getInputStream(), out);

			if (f1.getContentType().startsWith("image")) {
				thumbnailName = makeThumbnail(uploadName);
			}
		} catch (Exception e) {
			log.warning(e.getMessage());
		}

		log.info("" + detail);
		photo.setFile_name(thumbnailName);
		service.update(detail, photo);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/list/resultlist";
	}

	// 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam(name = "rno") int rno, RedirectAttributes red, @RequestParam(name="keyword") String keyword, Model model) {

		model.addAttribute("keyword", keyword);
		
		service.delete(rno);

		red.addFlashAttribute("msg", "ok");
		
		log.info("디테일 키워드"+keyword);
		
		return "redirect:/list/test?keyword="+keyword;

	}
	
	 @GetMapping("/review")
     @ResponseBody
     public List<ReviewRegister> getList(int rno){
 		log.info("getList");
 		
 		return rService.getReviews(rno);
	  }
	 
}