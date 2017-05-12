<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Studentdashboard.jsp"%>

<html>

<head>
<link rel="stylesheet" href="../style.css">


</head>
<body>
<h2>Welcome Page </h2>

<%
String user=(String)session.getAttribute("User");
session.setAttribute("User",user); 
if(user==null){
response.sendRedirect("login.html");
}
%>


<h4>Welcome <%=(String)session.getAttribute("User") %></h4> 

<p>
The exam contains all objective type questions. You are NOT allowed to move back 
to previous questions. So please answer a question and then move to next question.

<p>
<h4>select course which u want to take a test</h4>
<form action="#">
<select name="course">
  <option value="java">java</option>
  <option value="mysql">mysql</option>
  <option value="c">c</option>
  <option value="html">html</option>
  <option value="css">css</option>
</select>

  <input type="submit" value="Submit">
</form>
<br>

<% 
session.setAttribute("sub",request.getParameter("course"));  
%>
<a href="tests.jsp">Start Examination </a>

</html>
