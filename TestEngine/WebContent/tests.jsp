<%@page import="java.sql.*"%>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script  >
        var tim;
       
        var min = 20;
        var sec = 00;
        var f = new Date();
        function f1() {
            f2();
            document.getElementById("starttime").innerHTML = "Your started your Exam at " + f.getHours() + ":" + f.getMinutes();
             
          
        }
        function f2() {
            if (parseInt(sec) > 0) {
                sec = parseInt(sec) - 1;
                document.getElementById("showtime").innerHTML = "Your Left Time  is :"+min+" Minutes ," + sec+" Seconds";
                tim = setTimeout("f2()", 1000);
            }
            else {
                if (parseInt(sec) == 0) {
                    min = parseInt(min) - 1;
                    if (parseInt(min) == 0) {
                        clearTimeout(tim);
                        location.href = "result.jsp";
                    }
                    else {
                        sec = 60;
                        document.getElementById("showtime").innerHTML = "Your Left Time  is :" + min + " Minutes ," + sec + " Seconds";
                        tim = setTimeout("f2()", 1000);
                    }
                }
               
            }
        }
    </script>
   
</head>
<body onload="f1()" >

<form method="post" action="result.jsp">

      <table width="100%" align="center">
        <tr>
          <td colspan="2">
         
          </td>
        </tr>
        <tr>
          <td>
            <div id="starttime"></div><br />
            <div id="endtime"></div><br />
            <div id="showtime"></div>
          </td>
        </tr>
        <tr>
          <td>
             
              <br />
            
              
          </td>
         
        </tr>
      </table>
<div class="container">
<h2><B><p>Codegasm Online Test on <%=(String)session.getAttribute("sub") %> </p></B></h2>

<%

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Testengine","root", "1234");
PreparedStatement ps= ps=con.prepareStatement("Select * from questions where lang=?");
String q=(String)session.getAttribute("sub");
session.setAttribute("sub", q);
ps.setString(1,q);
ResultSet rs=ps.executeQuery();
int i=1;
while(rs.next()){
%>
  <div class="container">
    <div class="radio">Q<%=i%><label><%=rs.getString("question")%></label></div>
    <div class="radio"><label><input type="radio" value="A" name="radio<%=i%>"/><%=rs.getString("A")%></label></div>
    <div class="radio"><label><input type="radio" value="B" name="radio<%=i%>"/><%=rs.getString("B")%></label></div>
    <div class="radio"><label><input type="radio" value="C" name="radio<%=i%>"/><%=rs.getString("C")%></label></div>
    <div class="radio"><label><input type="radio" value="D" name="radio<%=i%>"/><%=rs.getString("D")%></label></div>
       </div>
<%
i++;
}
%>
<div><input type="submit" value="submit"></div>
</div>
</form>
</body>
</html>