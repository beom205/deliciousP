package com.delip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.delip.domain.Photo;
import com.delip.domain.ReviewRegister;
import com.delip.dto.Criteria;
import com.delip.mappers.PhotoMapper;
import com.delip.mappers.ReviewMapper;

import lombok.extern.java.Log;

@Log
@Service
public class ReviewRegisterServiceImpl implements ReviewRegisterService {

	@Autowired
	private ReviewMapper mapper;
	
	@Autowired
	private PhotoMapper pMapper;
	
	/*
	@Override
	public void reviewRegister(ReviewRegister reviewRegister) {
		log.info("serImpl" + reviewRegister);
		mapper.insertReview(reviewRegister);
	}*/
	
	@Override
	@Transactional
	public void reviewRegister(ReviewRegister reviewRegister, Photo photo) {
		mapper.insertReview(reviewRegister);
		
		photo.setBno(reviewRegister.getBno());
		pMapper.create(photo);
	}
	
	@Override
	public void reviewRemove(Integer rno) {

	}
	
	@Override
	public List<ReviewRegister> getReviews(Integer rno) {
		return mapper.getReviews(rno);
	}
	
	@Override
	public List<ReviewRegister> getReviewsList(Integer rno, Criteria cri) {
		log.info("service : getReviewList");
		return mapper.getReviewsList(rno, cri);
	}

}
