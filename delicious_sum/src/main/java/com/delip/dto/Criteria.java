package com.delip.dto;

public class Criteria {
	private int page;
	private int size;
	private int prange;
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int page, int size) {
		this.page = page;
		this.size = size;
	}
	public Criteria(int page, int size, int prange) {
		this.page = page;
		this.size = size;
		this.prange = prange;
	}
	
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize() {
		return this.size != 0? this.size:10;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPage() {
		return this.page;
	}
	public int getPrange() {
		return prange;
	}

	public void setPrange(int prange) {
		this.prange = prange;
	}
	
	public int getSkip() {
		return (this.page - 1) * this.size;
	}
	
}
