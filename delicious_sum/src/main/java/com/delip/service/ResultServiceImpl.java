package com.delip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delip.domain.Result;
import com.delip.dto.Criteria;
import com.delip.mappers.ResultMapper;

import lombok.extern.java.Log;

@Log
@Service
public class ResultServiceImpl implements ResultService {

	@Autowired
	private ResultMapper mapper;
	
	@Override
	public List<Result> getList(String keyword) {
		return mapper.getList(keyword);
	}
	 
//	@Override
//	public List<Result> getList(String search) {
//		log.info("서비스임플"+search);
//		return mapper.getList(search);
//	}
	
//	@Override
//	public int getListCount(Criteria cri) {
//		// TODO Auto-generated method stub
//		return mapper.getTotal(cri);
//	}

	@Override
	public Result get(Integer rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}
	
}
