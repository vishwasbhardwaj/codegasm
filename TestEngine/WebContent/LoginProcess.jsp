<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.testengine.Dao.RegisterDao" %>
<jsp:useBean id="obj" class="com.testengine.bean.User"/>
<jsp:setProperty property="*" name="obj"/>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet"> 
    
  
</head>
<body>
<%
String User=request.getParameter("username");
String pass=request.getParameter("password");


boolean status=RegisterDao.validate(User,pass);
System.out.println(status);
if(status)
{


          session.setAttribute("User",User);  
%>	

<jsp:forward page="Studentdashboard.jsp"/>  
<% 
session.setAttribute("session","True");
}
 
else
{
out.print("Sorry, email or password error");
%>
<jsp:include page="login.html"></jsp:include>
<%
}
%>
</body>
</html>