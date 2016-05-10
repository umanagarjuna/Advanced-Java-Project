<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Online Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>Online Banking<span class="style1"></span></h1>
</div>

<div id="navigation">
    <ul>
    <li><a href="create.html">NEW ACCOUNT</a></li>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="transaction1.jsp">TRANSACTIONS</a></li>
    </ul>
</div>

<%   	
        String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
		
		
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1);
		
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
	    boolean status=VerifyLogin1.checkLogin(accountno,username,password);
		
		try {
		if(status==true){
			%>
			
			<A href='index.html'></A>
			<% 
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+taccountno+"'");
			
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			    dataamount=accoun+rs.getInt(5); 	
			}
			//Connection con1=GetCon.getCon();
			
			PreparedStatement ps1=con.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+taccountno+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			
			PreparedStatement ps2=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			
            ps2.setInt(1,accountno);
			ResultSet rs2=ps2.executeQuery();
			
			int dataamount1=0;
			if(rs2.next()){
			dataamount1=rs2.getInt(5)-accoun; 
			out.println(dataamount1);
			}
			//Connection con3=GetCon.getCon();
			
			PreparedStatement ps3=con.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
			ps3.setInt(1,dataamount1);
			int i = ps3.executeUpdate();
			
			Connection cont = GetCon.getCon();
			try {
	            String insertOrderSql = " insert into transaction (accountno, time_stamp, amount, balance, description) "
				        + " values (?, ?, ?, ?, ?)";
			ps = cont.prepareStatement(insertOrderSql);
			ps2 = cont.prepareStatement(insertOrderSql);
		
			 Date curDate = new Date();
			 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		     String DateToStr = format.format(curDate);
		     
			 Date myDate = format.parse(DateToStr);
			java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
			String desc = "Transferred amount to account "+taccountno;
			String desc1 = "Transferred amount from account "+accountno;
			ps.setInt(1,accountno);
			ps.setDate(2,sqlDate);
			ps.setInt(3,accoun);
			ps.setInt(4,dataamount1);
			ps.setString(5,desc);
			
			ps2.setInt(1,taccountno);
			ps2.setDate(2,sqlDate);
			ps2.setInt(3,accoun);
			ps2.setInt(4,dataamount);	
			ps2.setString(5,desc1);
						
			ps.executeUpdate();
			ps2.executeUpdate();
			
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
			
			if(i!=0){
		
			request.setAttribute("targetaccount",taccountno);
			request.setAttribute("sourceaccount",accountno);
			request.setAttribute("targetaccountAmount",dataamount);
			request.setAttribute("accountB",dataamount1);	
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
			}
		}
		else{
			out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check your username and Password and target acountno");
			%>
			<jsp:forward page="transfer1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	%>

</div>
</body>
</html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.onlinebanking.db.*" %>
<%@ page import="com.onlinebanking.services.*" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>

   
