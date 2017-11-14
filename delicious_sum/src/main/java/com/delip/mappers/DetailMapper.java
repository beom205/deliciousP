package com.delip.mappers;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delip.domain.Detail;

	public interface DetailMapper extends CRUDMapper<Detail,Integer>{
	   
	  @Select("select * from dtb_restaurant where rno = #{rno}")
	   public Detail readDetail(int rno);	
		
	   @Update("update dtb_restaurant set" + 
	         "      rname = #{rname}," + 
	         "      raddress = #{radress}," + 
	         "      rhomepage = #{rhomepage}," + 
	         "      rtel = #{rtel} " + 
	         "    where rno = #{rno}")
	   public void updateDetail(Detail detail);

	   @Delete("delete from dtb_restaurant where  rno = #{rno}")
	   public void deleteDetail(int rno);

	}
 