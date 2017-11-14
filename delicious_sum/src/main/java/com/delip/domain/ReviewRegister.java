package com.delip.domain;


import lombok.Data;

@Data
public class ReviewRegister {
	private String conveninece_keyword, mood_keyword, purpose_keyword, content;
	private int avg_rate;
}
