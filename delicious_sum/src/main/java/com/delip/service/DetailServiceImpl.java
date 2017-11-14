package com.delip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delip.domain.Detail;
import com.delip.mappers.DetailMapper;

import lombok.extern.java.Log;

@Log
@Service
public class DetailServiceImpl implements DetailService {
   
   @Autowired
   private DetailMapper mapper;
   
   
   @Override
   
   public void create(Detail detail) {
      log.info("create");
      mapper.create(detail);
   }

   @Override
   public Detail get(Integer rno) {
      log.info("ServiceImple rno: " + rno);
      return mapper.readDetail(rno);
   }

   @Override
   public void update(Detail detail) {
      log.info("update");
   }

   @Override
   public void delete(Integer rno) {
      log.info("delete");
      
      mapper.deleteDetail(rno);
   }


}