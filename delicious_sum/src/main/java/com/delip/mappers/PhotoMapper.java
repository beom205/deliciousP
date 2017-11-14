package com.delip.mappers;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.delip.domain.Photo;

public interface PhotoMapper extends CRUDMapper<Photo, Integer>{
	/*
	@Insert("insert into dtb_photo_review(bno, rno, file_name, file_path) "
			+ "values(LAST_INSERT_ID(), #{rno}, #{file_name}, #{file_path})")
	public void create(Photo vo);
	*/
	
	
	/*@Insert("insert into tb_photo(rno, bno, file_name) values(#{rno}, #{bno}, #{file_name})")
	public void create(Photo photo);
	*/
	
	@Insert("insert into tb_photo(file_name) values(#{file_name})")
	public void create(Photo photo);
	
	@Select("select file_name from tb_photo where rno = #{rno}")
	public Photo read(Photo photo);
}
