<%-- 
    Document   : messageProcess
    Created on : May 10, 2017, 2:18:50 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<%
           
                String user=request.getParameter("username");
                String email=request.getParameter("email");
                String mobile=request.getParameter("mobile");
                String message=request.getParameter("body");
               try{
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost/testengine?"+"user=root&password=1234";
                Connection con=DriverManager.getConnection(url);
                PreparedStatement pst=con.prepareStatement("INSERT INTO message (username,email,mobile,message) values(?,?,?,?)");
            pst.setString(1, user);
            pst.setString(2, email);
            pst.setString(3, mobile);
            pst.setString(4, message);
             pst.executeUpdate();
              System.out.println(user);
            System.out.println(mobile);
            System.out.println(email);
            System.out.println(message);  }
            catch(SQLException sqle)
            {
                            System.out.println(sqle);

            }
            
            
            
             
             %>    