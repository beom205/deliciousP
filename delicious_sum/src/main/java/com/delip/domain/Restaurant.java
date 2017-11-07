package com.delip.domain;

import lombok.Data;

@Data
public class Restaurant {

	//rno, rname, radress, rlat, rlng : Not null
	//rlat : 위도, rlng : 경도
	private int rno, rcount, ravg;
	private String rname, radress, rtel, rhomepage, rlat, rlng, rholiday, rtime;
					
}
