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
	  
		try {
	   %>
	   
	   <c:out value="Welcome ${param.username}"></c:out>
		<%
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
            ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
		%>
		
		<c:out value="<table align='left' cellspacing='5' cellpadding='5'>" escapeXml="false"></c:out>
		<c:out value="<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>" escapeXml="false"></c:out>		
		<%	
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				//System.out.print(accountno);
				int acc = rs.getInt(1);
				String usrname = rs.getString(2);
				int amount = rs.getInt(5);
				String address = rs.getString(6);
				String phone = rs.getString(6);		         
				System.out.print(accountno);
				
				out.print("<tr>");
				out.print("<td>" + acc + "</td>");
				out.print("<td>" + usrname + "</td>");
				out.print("<td>" + amount + "</td>");
				out.print("<td>" + phone + "</td>");
				out.print("<td>" + accountno + "</td>");
				out.print("</tr>");
			
			}
		%>
		<c:out value="</table>" escapeXml="false"></c:out>
	
		<%
		 }catch (SQLException e) {
			e.printStackTrace();
		 }
	    %>
			</table>
			</td>
			</tr>
			</table>
			</div>
			</body>
			</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.onlinebanking.db.*" %>
<%@ page import="com.onlinebanking.services.*" %>

  
