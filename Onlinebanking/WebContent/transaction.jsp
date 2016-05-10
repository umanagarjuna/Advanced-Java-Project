<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<A href="index.html"></A>
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
<table>
<%
        String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
	
		try {
			%>  
			 <c:out value="Welcome ${param.username}"></c:out>
				<%
		
			Connection con=GetCon.getCon();
			//PreparedStatement ps=con.prepareStatement("Select * from TRANSACTION where accountno=?");
			PreparedStatement ps=con.prepareStatement("Select T1.tx_id,T1.accountno,T1.time_stamp,T1.amount,T1.balance,T1.description,T2.phone from TRANSACTION T1, NEWACCOUNT T2"
					+" where T1.accountno=? and T1.accountno=T2.accountno");
            ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left' cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>TXTIONID</th><th>ACCOUNTNO</th><th>TIMESTAMP</th><th>AMOUNT</th><th>BALANCE</th><th>DESCRIPTION</th><th>PHONE</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				
				System.out.print(accountno);
				
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getInt(2) + "</td>");
				out.print("<td>" + rs.getDate(3) + "</td>");
				out.print("<td>" + rs.getInt(4) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getString(7) + "</td>");
				out.print("</tr>");
			
			}
			out.print("</table>");		
		
	
		 }catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	</table><%
%>    	
</table>
</div>
</body>
</html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.onlinebanking.db.*" %>
<%@ page import="com.onlinebanking.services.*" %>

  
