package com.delip.mappers;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.delip.domain.ReviewRegister;

public interface ReviewMapper extends CRUDMapper<ReviewRegister, Integer> {
	
	/*@Insert("insert into dtb_review(uId, content, avg_rate, service_rate, price_rate,"
			+ " taste_rate, purpose_keyword, mood_keyword, convenience_keyword) "
			+ "values(#{uId}, #{content}, #{avg_rate}, #{service_rate}, #{price_rate}, #{taste_rate},"
			+ " #{purpose_keyword}, #{mood_keyword}, #{convenience_keyword})")
	public void insertReview(ReviewRegister reviewRegister);
	*/
	/*@Insert("insert into tb_test(test) values(#{test})")
	public void insertReview(ReviewRegister reviewRegister);
	*/
	
/*	@Insert("insert into dtb_review(rno, uid, content, writer, tag, file_name, file_path, avg_rate, service_rate, price_rate)"
			+ "values(#{rno}, #{uid}, #{content}, #{writer}, #{tag}, #{file_name}, #{file_path}, #{avg_rate}, #{service_rate}, #{price_rate})")
	public void insertReview(ReviewRegister reviewRegister);
*/	
	@Insert("insert into tb_test(conveninece_keyword, mood_keyword, purpose_keyword, avg_rate, content) values(#{conveninece_keyword}, #{mood_keyword}, #{purpose_keyword}, #{avg_rate}, #{content})")
	public void insertReview(ReviewRegister reviewRegister);
	
	@Delete("delete dtb_review where rno = #{rno} and bno = #{bno}")
	public void removeReview(@Param(value="rno")int rno,@Param(value="bno")int bno);
	
	
	
}
