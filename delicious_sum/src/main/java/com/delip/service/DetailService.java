package com.delip.service;

import java.util.List;

import com.delip.domain.Detail;
import com.delip.domain.Photo;
import com.delip.domain.ReviewRegister;

public interface DetailService {

   public int register(Detail detail, Photo photo);; //등록

   public Detail get(Integer rno); // 조회

   public void update(Detail detail, Photo photo); // 수정

   public void delete(Integer rno); // 삭제 

   public List<ReviewRegister> getReview(Integer rno); // 리뷰
   
   public String getPhoto(Integer rno);//사진 조회
   
 

}