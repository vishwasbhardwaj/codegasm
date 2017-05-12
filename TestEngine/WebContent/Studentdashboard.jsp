<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.testengine.Dao.LoginDao" %>
<jsp:useBean id="obj" class="com.testengine.bean.Login"/>
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
String User=(String)session.getAttribute("User");
session.setAttribute("User",User); 
if(User==null){
	 response.sendRedirect("login.html");
}
%>
<div id="conatiner">

   <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                    welcome  <%=(String)session.getAttribute("User") %>
                    </a>
                </li>
                <li>
                    <a href="StudentProfile.jsp">Profile</a>
                </li>
                <li>
                    <a href="startexam.jsp">Start test</a>
                </li>
                <li>
                    <a href="java.jsp">learn java</a>
                </li>
                
               <li>
                    <a href="css.jsp">learn css</a>
                </li>
                <li>
                    <a href="html.jsp">learn html</a>
                </li>
                <li>
                    <a href="takeexam.jsp">learn css</a>
                </li>
            </ul>
        </div>
     


</body>
</html>