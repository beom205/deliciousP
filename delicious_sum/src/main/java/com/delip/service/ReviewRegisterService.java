package com.delip.service;

import com.delip.domain.ReviewRegister;

public interface ReviewRegisterService {
	
//	public void reviewRegister( reviewRegister);
	public void reviewRegister(ReviewRegister reviewRegister);
	
	public void reviewRemove(Integer rNo);
}
