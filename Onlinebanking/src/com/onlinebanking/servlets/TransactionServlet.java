package com.onlinebanking.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinebanking.services.VerifyLogin1;

/**
 * Servlet implementation class TransactionServlet
 */
public class TransactionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		 String num=request.getParameter("accountno");
			int accountno=Integer.parseInt(num);
	        String username=request.getParameter("username");
			String password=request.getParameter("password");
		    boolean status=VerifyLogin1.checkLogin(accountno,username,password);
	   
	    
		if(status==true){
			RequestDispatcher rd=request.getRequestDispatcher("transaction.jsp");
			rd.include(request, response);
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("transaction","Please check your username and Password");
			RequestDispatcher rd=request.getRequestDispatcher("transaction1.jsp");
			rd.include(request, response);
		}
		
	out.close();	
	
	}

}
