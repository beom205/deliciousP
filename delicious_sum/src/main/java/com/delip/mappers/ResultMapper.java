package com.delip.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.delip.domain.Result;
import com.delip.dto.Criteria;

public interface ResultMapper extends CRUDMapper<Result, Integer>{


	public void create();
	
	public List<Result> getList(String string);
	
//	@Select("select * from dtb_restaurant order by rno desc ")
//	public List<Result> getList();
	
//	@Select("select * from dtb_restaurant where raddress like '%$search$%' ")
//	public List<Result> getList(String search);
	
//	@Select("select count(rno) from dtb_restaurant ")
//	public int getTotal(Criteria cri);

}
