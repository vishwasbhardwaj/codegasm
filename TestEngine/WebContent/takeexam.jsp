<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String User=(String)session.getAttribute("User");
session.setAttribute("User",User); 
if(User==null){
	 response.sendRedirect("login.html");
}
%>
 <div id="section">
    <h2>Instructions:</h2>
    <ul>
	  <li>Total Questions: 15</li>
	  <li>Time Alloted: 20 Minutes</li>
	  <li>Questions based on C and C+</li>
	  <li>There is no negative marking</li>
	  <li>Top 20 will be short listed for the next round</li>
	  <li>Click on <b>Start</b> button to start the test</li>
	  <li>After the test starts, don't press back or refresh button or don't close the browser window</li>
	</ul>  
    
    <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button id="start" style="width:60px;height:30px" onClick="parent.location='tests.jsp'">Start</button>    
    </div>
    
</body>
</html>