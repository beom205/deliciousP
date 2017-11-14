package com.delip.service;

import java.util.List;

import com.delip.domain.Detail;

public interface DetailService {

   public void create(Detail detail); //등록

   public Detail get(Integer rno); // 조회

   public void update(Detail detail); // 수정 

   public void delete(Integer rno); // 삭제 
   

}