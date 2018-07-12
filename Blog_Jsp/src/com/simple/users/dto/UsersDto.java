package com.simple.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String email;
	private String regDate;
	
	public UsersDto() {}

	public UsersDto(String id, String pwd, String email, String regDate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	
}
