
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profle</title>
<style>
.form-group{
margin:40px;

}
</style>
 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/testengine"  
     user="root"  password="1234"/>
</head>
<body>
<%@include file="Studentdashboard.jsp"%>
      <form role="form" action="#" method="post">

       <%
      String s= (String)session.getAttribute("User");
       session.setAttribute("User",s); 
       if(s==null){
       	 response.sendRedirect("login.html");
       }
       
       %>
  
        <sql:query dataSource="${db}" var="rs">  
          SELECT * from Register where username=?;
             <sql:param value="<%=s%>" />  
          </sql:query> 
          <c:forEach var="f" items="${rs.rows}"> 
    <div class="col-xs-4">
         <div class="form-group">
           <label for="usr">Name:</label>
         <input type="text" class="form-control" value="${f.username}" name="username">
        </div>
     <div class="form-group">
          <label>Password</label>
           <input type="Password" class="form-control" value="${f.password}" name="password">
     </div>
     <div class="form-group">
           <label>Email</label>
           <input type="email" class="form-control" value="${f.email}" name="email">
    </div>
     <div class="form-group">
            <label>Mobileno</label>
            <input type="number" class="form-control" value="${f.mobile}" name="mobile">
    </div>
    <center> <button type="submit" class="btn btn-success">Update</button><center>
     </div>
      </c:forEach>
     </form>
      <c:if test="${pageContext.request.method=='POST'}">

        <sql:update dataSource="${db}" var="updatedTable">
      UPDATE  Register SET username=? ,password=?,email=?,mobile=? where username=?;
             <sql:param value="${param.username}" />
             <sql:param value="${param.password}" />
             <sql:param value="${param.email}" />
             <sql:param value="${param.mobile}" />
               <sql:param value="<%=s%>" /> 
       </sql:update>
       <c:if test="${updatedTable>=1}">
     <font size="5" color='green'> Congratulations ! Data is updated
     successfully.</font>
       </c:if>
    </c:if>
</body>
</html>