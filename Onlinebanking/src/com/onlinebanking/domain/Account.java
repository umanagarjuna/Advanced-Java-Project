package com.onlinebanking.domain;

public class Account {

	private int accountno;
	private String username;
	private String password;
	private String repassword;
	private int amount;
	private String address;
	private String phone;
	public Account(){
		
	}
	public Account(int accountno, String username, String password, String repassword, int amount, String address,
			String phone) {
		this.accountno = accountno;
		this.username = username;
		this.password = password;
		this.repassword = repassword;
		this.amount = amount;
		this.address = address;
		this.phone = phone;
	}



	public int getAccountno() {
		return accountno;
	}
	public void setAccountno(int accountno) {
		this.accountno = accountno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
