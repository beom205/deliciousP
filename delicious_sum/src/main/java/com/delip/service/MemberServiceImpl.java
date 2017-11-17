package com.delip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delip.domain.Member;
import com.delip.mappers.MemberMapper;

import lombok.extern.java.Log;

@Log
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void register(Member member) {
		mapper.register(member);
	}

	@Override
	public Member getMemberIdAndPw(Member member) {
		return mapper.getMemberIdAndPw(member);
	}

	@Override
	public Integer checkId(String uid) {
		return mapper.checkId(uid);
	}

}
