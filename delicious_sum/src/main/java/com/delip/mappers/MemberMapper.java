package com.delip.mappers;

import org.apache.ibatis.annotations.Insert;

import com.delip.domain.Member;
	
public interface MemberMapper extends CRUDMapper<Member, Integer> {
	
	@Insert("insert into dtb_member values (#{uid}, #{upassword}, #{file_name}, #{file_path}, #{uname}, #{ulevel}, #{utel})")
	public void register(Member m);
}
