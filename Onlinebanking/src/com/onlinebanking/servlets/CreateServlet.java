package com.onlinebanking.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinebanking.domain.Account;
import com.onlinebanking.services.RegisterUser;



public class CreateServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Account acc = new Account();
		String username=request.getParameter("username");
		acc.setUsername(username);
		String password=request.getParameter("password");
		acc.setPassword(password);
		String  repassword=request.getParameter("repassword");
		acc.setRepassword(repassword);
		
		String amoun=request.getParameter("amount");
		
		int amount=Integer.parseInt(amoun);
		acc.setAmount(amount);
		String address=request.getParameter("adderess");
		acc.setAddress(address);
		
		String ph=request.getParameter("phone");
		acc.setPhone(ph);
		
	    int status=RegisterUser.register(acc);
	   
	    
		if(status>0){
			out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		else{
			out.print("Sorry,Registration failed. please try later");
			RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			rd.include(request, response);
		}
		
	out.close();	
	}

}
