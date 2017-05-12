<%-- 
    Document   : Mail
    Created on : May 5, 2017, 7:08:25 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%!
   String result;
   
   // Recipient's email ID needs to be mentioned.
   String to = "Ajaybisht9537@gmail.com";

   // Sender's email ID needs to be mentioned
   String from = " ";

   // Assuming you are sending email from localhost
   String host = "localhost";

   // Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   properties.setProperty("mail.smtp.host", host);

   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(properties);

   try {
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      
      // Set Subject: header field
      message.setSubject("This is the Subject Line!");
     
      // Send the actual HTML message, as big as you like
      message.setContent("<h1>This is actual message</h1>", "text/html" );
      
      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
   } catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>


<html>
   <head>
      <title>Send Attachment Email using JSP</title>
   </head>
   
   <body>
      <center>
         <h1>Send Attachment Email using JSP</h1>
      </center>
      
      <p align = "center">
         <%out.println("Result: " + result + "\n");%>
      </p>
   </body>
</html>