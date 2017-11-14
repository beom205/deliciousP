package com.delip.service;

import java.util.List;

import com.delip.domain.Result;
import com.delip.dto.Criteria;

public interface ResultService {
	
	public Result get(Integer rno);
	
//    public List<Result> getList();

//	int getListCount(Criteria cri);

	List<Result> getList(String keyword);


}
