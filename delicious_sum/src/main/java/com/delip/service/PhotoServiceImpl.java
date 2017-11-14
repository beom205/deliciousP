package com.delip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delip.domain.Photo;
import com.delip.mappers.PhotoMapper;

@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Autowired
	private PhotoMapper pMapper;
	
	@Override
	public void register(Photo photo) {
		pMapper.create(photo);
	}
	
	@Override
	public Photo getPhoto(Photo photo) {
		
		return pMapper.read(photo);
	}
}
