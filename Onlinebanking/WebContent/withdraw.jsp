<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.onlinebanking.db.*" %>
<%@ page import="com.onlinebanking.services.*" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
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
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
	    boolean status=VerifyLogin1.checkLogin(accountno,username,password);
		
		try {
		if(status==true){
			out.print("Welcome    " + username);
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			
            ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=rs.getInt(5)-accoun; 
			
			}
			Connection con1=GetCon.getCon();
			
			PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			

			Connection cont = GetCon.getCon();
			try {
	            String insertOrderSql = " insert into transaction (accountno, time_stamp, amount, balance, description) "
				        + " values (?, ?, ?, ?, ?)";
			ps = cont.prepareStatement(insertOrderSql);
		
			 Date curDate = new Date();
			 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		     String DateToStr = format.format(curDate);
		     
			 Date myDate = format.parse(DateToStr);
			java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
			
			ps.setInt(1,accountno);
			ps.setDate(2,sqlDate);
			ps.setInt(3,accoun);
			ps.setInt(4,dataamount);
			ps.setString(5,"withdraw amount");
						
			ps.executeUpdate();
			
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			%>
			<br>
			<%
			//out.print("The new balance is ");
			request.setAttribute("totaldataamount",dataamount);
			request.setAttribute("balance","your balance has decreased... The new balance is ");	
			%>
			<jsp:forward page="Totalbalance.jsp"></jsp:forward> 
			<% 
			
			
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="withdraw1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
	%>
</div>
</body>
</html>




   
