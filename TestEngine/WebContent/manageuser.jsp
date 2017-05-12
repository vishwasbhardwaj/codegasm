<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <!--<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/TestEngine"  
     user="root"  password="1234"/>-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/TestEngine"  
     user="root"  password="1234"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
</head>
<body>
<%@include file="adminheader.jsp"%>

<div class="container">
<ul class="nav nav-pills">
<li class="active">
  <a href="#user" class="btn btn-info" data-toggle="pill">user</a></li>
  <li><a href="#adduser" class="btn btn-info" data-toggle="pill">adduser</a></li></ul>
 
  
    <div class="tab_content">
    <div id="user" class="tab-pane fade in active" >
      <h3>user</h3>
   
  
         <sql:query dataSource="${db}" var="rs">  
           SELECT * from register;  
            </sql:query>  
   
   
<table border="2" width="100%">  
<tr>  
<th>Username</th>  
<th>password</th>  
<th>email</th>  
<th>mobile</th>  
</tr>  
<c:forEach var="table" items="${rs.rows}">  
<tr>  
<td><c:out value="${table.username}"/></td>  
<td><c:out value="${table.password}"/></td>  
<td><c:out value="${table.email}"/></td>  
<td><c:out value="${table.mobile}"/></td>  
</tr>  
</c:forEach>  
</table> 
     
  
     </div>
     <div id="adduser"   class="tab-pane fade">
     <form method="post">
  <div class="form-group">
    <label for="text">username</label>
    <input type="text" class="form-control" name="name">
  </div>
  <div class="form-group">
    <label for="text">Password:</label>
    <input type="password" class="form-control" name="pass">
  </div>
 
  
  <div class="form-group">
    <label for="text">email</label>
    <input type="email" class="form-control" name="email">
  </div>
   <div>
    <label for="text">mobile</label>
    <input type="text" class="form-control" name="mobile">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <c:if test="${pageContext.request.method=='POST'}">
    <c:catch var="exception">
        <sql:update dataSource="${db}" var="updatedTable">
      INSERT INTO Register(username,password,email,mobile) VALUES (?, ?, ?, ?);
             <sql:param value="${param.name}" />
             <sql:param value="${param.pass}" />
             <sql:param value="${param.email}" />
             <sql:param value="${param.mobile}" />
       </sql:update>
       <c:if test="${updatedTable>=1}">
     <font size="5" color='green'> Congratulations ! Data inserted
     successfully.</font>
       </c:if>
    </c:catch>
      <c:if test="${exception!=null}">
      <c:out value="Unable to insert data in database." />
    </c:if>
    </c:if>
     </div>
       
       </div>
     </div>
</body>
</html>