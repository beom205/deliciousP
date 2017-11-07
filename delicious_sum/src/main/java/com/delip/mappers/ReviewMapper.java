package com.delip.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import com.delip.domain.ReviewRegister;

public interface ReviewMapper extends CRUDMapper<ReviewRegister, Integer> {
	
	@Insert("insert into dtb_review(content, tag) values(${content}, ${tag})")
	public List<ReviewRegister> insertReview(ReviewRegister reviewRegister);
	
	
	
}
