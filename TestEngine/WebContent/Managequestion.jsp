<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
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
        <%@include file="adminheader.jsp" %>
        <div class="container">
            <ul class="nav nav-pills">
                <li class="active"><a href="#question">Question</a></li>
                <li><a href="#addQuestion">addQuestion</a></li>
            </ul>
            <div id="tab content">
                <div id="question" class="tab-pane fade in active">


                    <sql:query dataSource="${db}" var="rs">  
                        SELECT * from questions;  
                    </sql:query>  

                    <table border="2" width="100%">  
                        <tr>  
                            <th>question</th>  
                            <th>option A</th>  
                            <th>option B</th>  
                            <th>option C</th>  
                            <th>option D</th> 
                            <th>Answer</th> 
                        </tr>  
                        <c:forEach var="table" items="${rs.rows}">  
                            <tr>  
                                <td><c:out value="${table.question}"/></td>  
                                <td><c:out value="${table.A}"/></td>  
                                <td><c:out value="${table.B}"/></td>  
                                <td><c:out value="${table.C}"/></td> 
                                <td><c:out value="${table.D}"/></td> 
                                <td><c:out value="${table.Answer}"/></td>
                            </tr>  
                        </c:forEach>  
                    </table> 
                </div>
                <div id="addQuestion">

                    <form method="post">
                        <div class="form-group">
                            <label for="text">lang</label>
                            <input type="text" class="form-control" name="lang">
                        </div>
                        <div class="form-group">
                            <label for="text">question</label>
                            <textarea name="question" rows="10" cols="30">

                            </textarea>
                        </div>


                        <div class="form-group">
                            <label for="text">option A</label>
                            <input type="text" class="form-control" name="A">
                        </div>
                        <div>
                            <label for="text">Option B</label>
                            <input type="text" class="form-control" name="B">
                        </div>
                        <div>
                            <label for="text">Option C</label>
                            <input type="text" class="form-control" name="C">
                        </div>
                        <div>
                            <label for="text">Option D</label>
                            <input type="text" class="form-control" name="D">
                        </div>
                        <div>
                            <label for="text">Answer</label>
                            <input type="text" class="form-control" name="Answer">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <c:if test="${pageContext.request.method=='POST'}">
                        <c:catch var="exception">
                            <sql:update dataSource="${db}" var="updatedTable">
                                INSERT INTO questions(lang,question,A,B,C,D,Answer) VALUES (?, ?, ?, ?, ?, ?, ?);
                                <sql:param value="${param.lang}" />
                                <sql:param value="${param.question}" />
                                <sql:param value="${param.A}" />
                                <sql:param value="${param.B}" />
                                <sql:param value="${param.C}" />
                                <sql:param value="${param.D}" />
                                <sql:param value="${param.Answer}"/>

                            </sql:update>
                        </c:catch>
                        <c:if test="${exception!=null}">
                            <c:out value="Unable to insert data in database." />
                        </c:if>
                        <c:if test="${updatedTable>=1}">
                            <font size="5" color='green'> Congratulations ! Data inserted
                                successfully.</font>
                            </c:if>

                    </c:if>
                </div>

            </div>
        </div>

    </body>
</html>