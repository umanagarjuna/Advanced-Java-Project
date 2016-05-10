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
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >   
    <td width="1200" valign="top">	
<table><%
        String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
	    boolean status=VerifyLogin1.checkLogin(accountno,username,password);
		try {
		if(status==true){
		%>
			<c:out value="Welcome ${param.username}"></c:out>
		<%
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("delete from NEWACCOUNT where accountno='"+accountno+"'");
            //ps.setInt(1,accountno);
			ps.executeUpdate();			
			out.print("&nbsp;&nbsp;&nbsp;your account no '"+accountno+"' has closed.");
			out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href='index.html'></A>");						
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="closeac1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}   	
			%></table><%
%>    	
		 </table>
		 </div>
		 </body>
		 </html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="com.onlinebanking.db.*" %>
<%@ page import="com.onlinebanking.services.*" %>


   
