package com.delip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delip.domain.ReviewRegister;
import com.delip.mappers.ReviewMapper;

import lombok.extern.java.Log;

@Log
@Service
public class ReviewRegisterServiceImpl implements ReviewRegisterService {

	@Autowired
	private ReviewMapper mapper;
	/*
	@Override
	public void reviewRegister(ReviewRegister reviewRegister) {
		log.info("serImpl" + reviewRegister);
		mapper.insertReview(reviewRegister);
	}*/
	@Override
	public void reviewRegister(ReviewRegister reviewRegister) {
		mapper.insertReview(reviewRegister);
	}
	
	@Override
	public void reviewRemove(Integer rno) {

	}

}
