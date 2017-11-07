package com.delip.service;

import javax.sql.DataSource;

import lombok.Setter;

@Setter
public class HelloService {
	private DataSource ds; // import javax.sql.DataSource;

	public String sayHello() {
		return "Hello Effy!";
	}

}
