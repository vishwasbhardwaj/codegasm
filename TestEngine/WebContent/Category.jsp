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
<li class="active"><a data-toggle="pill" href="#Category">Category</a></li>
<li><a data-toggle="pill" href="#Addcategory">AddCategory</a></li></ul>
<div class="tab_content">
<div id="Category" class="tab-pane fade in active">
       <sh:categorylist/>
     </div>
     <div id="Addcategory" class="tab-pane fade">
     <form role="form" action="addCategoryprocess.jsp" method="post">
    <div class="form-group">
   <label>Addcategory</label>
     <input type="text" class="form-control" name="categoryname">
      <label>AddStatus</label>
      <select name="status">
      <option>Active</option>
      <option>InActive</option>
      </select>
     <button>add</button>
    </div>
         </form>
   
     </div>
    </div>	
    </div>


</body>
</html>