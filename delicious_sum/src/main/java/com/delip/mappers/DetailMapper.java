package com.delip.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delip.domain.Detail;
import com.delip.domain.ReviewRegister;

public interface DetailMapper extends CRUDMapper<Detail, Integer> {

	
	@Select("select * from dtb_restaurant rt " + 
			"inner join dtb_review rv " + 
			"on rt.rno = rv.rno " + 
			"inner join dtb_review_photo rp " + 
			"on rv.bno = rp.bno " + 
			"where rv.rno = #{rno}")
	public List<ReviewRegister> readReview(int rno);
	
	@Insert("insert into dtb_restaurant(rname, raddress, rtel, rhomepage, rinfo, rholiday, rtime,rlng,rlat)"
			+ "values(#{rname},#{raddress},#{rtel},#{rhomepage},#{rinfo},#{rholiday},#{rtime},#{rlng},#{rlat})")
	public void register(Detail detail);

	@Select("select * from dtb_restaurant where rno = #{rno}")
	public Detail readDetail(int rno);

	@Update("update dtb_restaurant set " 
			+ " rname = #{rname}," 
			+ " raddress = #{raddress},"
			+ " rhomepage = #{rhomepage}," 
			+ " rtel = #{rtel}, " 
			+ " rinfo = #{rinfo}, " 
			+ " rholiday = #{rholiday}, " 
			+ " rtime = #{rtime} " 
			+ " where rno = #{rno} ")
	public void updateDetail(Detail detail);

	@Delete("delete from dtb_restaurant where  rno = #{rno}")
	public void deleteDetail(int rno);

}
