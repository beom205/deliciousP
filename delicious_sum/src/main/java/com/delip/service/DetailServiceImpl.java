package com.delip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.delip.domain.Detail;
import com.delip.domain.Photo;
import com.delip.domain.ReviewRegister;
import com.delip.mappers.DetailMapper;
import com.delip.mappers.DetailPhotoMapper;

import lombok.extern.java.Log;

@Log
@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper mapper;

	@Autowired
	private DetailPhotoMapper pMapper;

	@Override
	@Transactional
	public void register(Detail detail, Photo photo) {
		log.info("register");
		mapper.register(detail);
		log.info("디테일 등록은 완료, but photo는 아직임");
		pMapper.restPhoto(photo);

	}

	@Override
	public Detail get(Integer rno) {
		log.info("ServiceImple rno: " + rno);
		return mapper.readDetail(rno);
	}

	@Override
	@Transactional
	public void update(Detail detail, Photo photo) {
		mapper.updateDetail(detail);
		pMapper.modiPhoto(photo);
	}

	@Override
	public void delete(Integer rno) {
		log.info("delete");
		mapper.deleteDetail(rno);
	}

	@Override
	public List<ReviewRegister> getReview(Integer rno) {
		log.info("ServiceImple rno: " + rno);

		return mapper.readReview(rno);
	}

}
