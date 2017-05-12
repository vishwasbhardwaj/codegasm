<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib prefix="sh" tagdir="/WEB-INF/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="adminheader.jsp"%>
<%@page import="com.testengine.Dao.CategoeryDao" %>
<%@page import=" java.util.ArrayList" %>
<%@page import="com.testengine.Dao.CategoeryDao" %>
<div class="container">
<ul class="nav nav-pills">
<li class="active"><a data-toggle="pill" href="#Student">Student</a></li>
<li><a data-toggle="pill" href="#AddStudent">AddStudent</a></li></ul>
<div class="tab_content">
<div id="Student" class="tab-pane fade in active">
    

     </div>
     <div id="AddStudent" class="tab-pane fade">
      <form role="form" action="addStudentprocess.jsp" method="post">
     <div class="form-group">
     <label for="usr">StudentName:</label>
       <input type="text" class="form-control" name="uname">
     </div>
    <div class="form-group">
    <label>Father Name</label>
    <input type="text" class="form-control" name="fname">
    </div>
     <div class="form-group">
    <label>Mother Name</label>
    <input type="text" class="form-control" name="mname">
    </div>
      <div class="form-group">
    <label>Dob</label>
    <input type="Date" class="form-control" name="dob">
    </div>
     <div class="form-group">
    <label>Address</label>
    <input type="textarea" class="form-control" name="address">
    </div>
      <div class="form-group">
    <label>Mobileno</label>
    <input type="number" class="form-control" name="umobile">
    </div>
      <div class="form-group">
    <label>Email</label>
    <input type="email" class="form-control" name="uemail">
    </div>
      <div class="form-group">
    <label>Password</label>
    <input type="Password" class="form-control" name="upass">
    </div>
      <div class="form-group">
   
    <button class="btn btn-primary">add student</button>
    </div>
    </form>
     </div>
    </div>	
    </div>


</body>
</html>