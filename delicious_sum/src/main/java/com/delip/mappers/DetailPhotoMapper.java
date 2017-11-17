package com.delip.mappers;

import com.delip.domain.Photo;

public interface DetailPhotoMapper extends CRUDMapper<Photo, Integer> {
	
	public void restPhoto(Photo photo);
	
	public void regiPhotoTest(Photo photo);
	
	public void modiPhoto(Photo photo);
	
	public String readPhoto(int rno);

}
