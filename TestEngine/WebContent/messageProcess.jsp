<%-- 
    Document   : messageProcess
    Created on : May 14, 2017, 7:59:10 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <script>
            function doc()
                {
                    alert("Submitted succesfully");
                    window.location.assign("index.html");
                }

            </script>
    </head>
    <body>
        <%
            
                String name=request.getParameter("name");
                String email=request.getParameter("mail");
                String subject=request.getParameter("subject");
                String body=request.getParameter("message");
            try{
                Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testengine", "root", "1234");
  PreparedStatement ps = con.prepareStatement("insert into message(username,email,mobile,message)values(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, body);
            int a = ps.executeUpdate();
              System.out.println(name);
            System.out.println(email);
            System.out.println(subject);
          //  System.out.println(message);
            }
            catch(SQLException sqle)
            {
                            System.out.println(sqle);

                   response.sendRedirect("index.html");
                       
            }
            %>
    </body>
</html>
