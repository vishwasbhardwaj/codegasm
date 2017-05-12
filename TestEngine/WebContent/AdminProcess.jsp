<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@page import="com.testengine.Dao.LoginDao" %>

<jsp:useBean id="obj" class="com.testengine.bean.Login"/>
<jsp:setProperty property="*" name="obj"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Welcome Admin</title>

  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
  <script src="vendor/jquery/jquery.min"></script>
  <script src="vendor/bootstrap/js/bootstrap.min"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Codegasm</a>
	    
    </div>
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="admin.html"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<% 
obj.setUsername(request.getParameter("name"));
obj.setPassword(request.getParameter("pwd"));
boolean status=LoginDao.validate(obj);
System.out.println(status);
if(status)
{
%> <div class="jumbotron">
    <h1> Welcome admin to the  Codegasm </h1>
    
</div>

<button><a href="admindashbord.html">continue</a></button>
<% 
session.setAttribute("session","True");
}
 
else
{
out.print("Sorry, email or password error");
}
%>


</body>
</html>