package com.delip.service;

import java.util.List;

import com.delip.domain.Photo;
import com.delip.domain.ReviewRegister;
import com.delip.dto.Criteria;

public interface ReviewRegisterService {
	
//	public void reviewRegister( reviewRegister);
	public void reviewRegister(ReviewRegister reviewRegister, Photo photo);
	
	public void reviewRemove(Integer rno);
	
	public List<ReviewRegister> getReviews(Integer rno);
	
	public List<ReviewRegister> getReviewsList(Integer rno, Criteria cri);
}
