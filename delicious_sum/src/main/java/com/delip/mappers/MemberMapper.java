package com.delip.mappers;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.delip.domain.Member;
	
public interface MemberMapper extends CRUDMapper<Member, Integer> {
	
	@Insert("insert into dtb_member(uid, upw, file_name, file_path, uname, utel) values (#{uid}, #{upw}, #{file_name}, #{file_path}, #{uname}, #{utel})")
	public void register(Member m);
	
	@Select("select * from dtb_member where uid=#{uid} and upw=#{upw}")
	public Member getMemberIdAndPw(Member m);
	
	@Select("select count(*) from dtb_member where uid=#{uid} ")
	public Integer checkId(String uid);
	
}
