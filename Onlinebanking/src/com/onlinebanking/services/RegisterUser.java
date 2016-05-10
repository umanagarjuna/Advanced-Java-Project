package com.onlinebanking.services;


import java.sql.*;

import com.onlinebanking.domain.Account;

import com.onlinebanking.db.GetCon;
public class RegisterUser {
static int status=0;
//int accountno=1;
public static int register(Account acc){
	//public static int register(String email,String password,String gender,String country,String name){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		 String insertOrderSql = " insert into newaccount (username, password, repassword, amount, address, phone) "
			        + " values (?, ?, ?, ?, ?, ?)";
           
		ps = con.prepareStatement(insertOrderSql);
		
		ps.setString(1,acc.getUsername());
		ps.setString(2,acc.getPassword());
		ps.setString(3,acc.getRepassword());
		ps.setInt(4,acc.getAmount());
		ps.setString(5,acc.getAddress());
		ps.setString(6,acc.getPhone());
		
		status=ps.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return status;
	
}
}
