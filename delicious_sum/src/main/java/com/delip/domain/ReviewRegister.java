package com.delip.domain;


import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReviewRegister {
	private int bno, rno, avg_rate, service_rate, price_rate, taste_rate;
	private String uid, content, mood_keyword, convenience_keyword, purpose_keyword, mphoto;
	private List<ReviewRegister> rphoto;
	private Date reg_date;
}
