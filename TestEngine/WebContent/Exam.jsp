<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<!DOCTYPE HTML>

<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/TestEngine"  
     user="root"  password="1234"/>
   
</head>
<script>
<!--
<%
String clock = request.getParameter( "clock" );
if( clock == null ) clock = "180";
%>
var timeout = <%=clock%>;
function timer()
{
if( --timeout > 0 )
{
document.forma.clock.value = timeout;
window.setTimeout( "timer()", 1000 );
}
else
{
document.forma.clock.value = "Time over";
///disable submit-button etc
}
}
//-->
</script>
<body>
<form action="<%=request.getRequestURL()%>" name="forma">
Seconds remaining: <input type="text" name="clock" value="<%=clock%>" style="border:0px solid white">
...
</form>
<script>
<!--
timer();
//-->
</script>

<% 
String q=(String)session.getAttribute("sub");
out.print(q);
%>
<sql:query dataSource="${db}" var="rs">  
SELECT * from questions where lang=?;
<sql:param value="<%=q %>"/>  
 
</sql:query> 
 <div class="container">
<% 
String s,g;
int count=0;
%>
<form action="result.jsp">
  <p><h1>Online Test</h1></p>
<c:forEach var="table" items="${rs.rows}">  
      <form action="#Answer">
           
    <p><input type="hidden" name="correctAns" value="<c:out value="${table.Answer}"/>" /><c:out value="${table.question}"/></p>
    <div class="radio">
    
      <label><input type="radio" name="a" value="A"><c:out value="${table.A}"/></label>
    </div>
    <div class="radio">
      <label><input type="radio" name="a" value="B"><c:out value="${table.B}"/></label>
    </div>
    <div class="radio ">
      <label><input type="radio" name="a" value="C" ><c:out value="${table.C}"/></label>
    </div>
    <div class="radio disabled">
      <label><input type="radio" name="a" value="D" ><c:out value="${table.D}"/></label>
    </div>
          
              <button type="button" class="btn btn-warning">Save</button>
      </form>
          
          
          
      
        <div id="Answer">       
        <c:set var="ans" scope="session" value="${table.Answer}"/>  
 
           <% 
           String answ=(String)pageContext.getAttribute("ans");  
         
               String ans=" ";
             if(request.getParameter("answ")!=null)
                   {
             ans=request.getParameter("answ").toString();
                   }
         
             %>
          <% g=request.getParameter("a");
                 %>
            
  
               
              </div>
                </c:forEach> 
                <label><div style="text-align:center"><button type="button" class="btn btn-success"><a href="result.jsp">Submit</button></div><label>
    </form>

               </div>

</body>

</html>