package com.delip.mappers;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.delip.domain.ReviewRegister;
import com.delip.dto.Criteria;

public interface ReviewMapper extends CRUDMapper<ReviewRegister, Integer> {

	public void insertReview(ReviewRegister reviewRegister);
	
	public List<ReviewRegister> getReviews(int rno);
	
	public List<ReviewRegister> getReviewsList(@Param("rno") int rno, @Param("cri") Criteria cri);
	
	@Delete("delete dtb_review where rno = #{rno} and bno = #{bno}")
	public void removeReview(@Param(value="rno")int rno,@Param(value="bno")int bno);
	
}
