package com.delip.web;

import java.awt.image.BufferedImage;
import java.io.File;
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
	public String RegisterPost(Photo photo, Detail detail, RedirectAttributes rttr, MultipartFile f1) {

		log.info(f1.getOriginalFilename());
		log.info(f1.getContentType());
		log.info("" + f1.getSize());

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
		service.register(detail, photo);

		rttr.addFlashAttribute("result", "success");
		return "redirect:/list/resultlist";
	}

	private String makeThumbnail(String fileName) throws Exception {

		BufferedImage sourceImg = ImageIO.read(new File("C:\\zzz\\", fileName));

		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbnailName = "C:\\zzz\\" + File.separator + "s_" + fileName;

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

		log.info(f1.getOriginalFilename());
		log.info(f1.getContentType());
		log.info("" + f1.getSize());

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
	public String remove(@RequestParam(name = "rno") int rno, RedirectAttributes red) {

		service.delete(rno);

		red.addFlashAttribute("msg", "ok");

		return "/list/resultlist";

	}
	
	 @GetMapping("/review")
     @ResponseBody
     public List<ReviewRegister> getList(int rno){
 		log.info("getList");
 		
 		return rService.getReviews(rno);
	  }
	
	
}