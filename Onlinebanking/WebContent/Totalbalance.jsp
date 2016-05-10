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
    	<% 
%>
<table>
		<tr>
			<td align="center" valign="middle" bgcolor="red"><h4>Account Info</h4></td>
		</tr>
		<tr>
			<td>
			
			<c:if test="${balance != null}">
				<c:out value="${balance}"></c:out>
				<c:out value="${totaldataamount}"></c:out>
			</c:if>
			</td>
		</tr>
    		</table><%
%>   	
		 </table>	
</div>
</body>
</html>