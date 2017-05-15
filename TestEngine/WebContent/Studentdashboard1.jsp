<%-- 
    Document   : Studentdashboard1
    Created on : May 13, 2017, 6:53:47 AM
    Author     : hp
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet"> 
    
  
</head>
<body>
<%
     String user_name=(String)request.getParameter("user_name");
     String user_email=(String)request.getParameter("user_email");
%>
<div id="conatiner">

   <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                    welcome <%= u %>
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


