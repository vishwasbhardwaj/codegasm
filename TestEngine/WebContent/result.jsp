<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@include file="Studentdashboard.jsp"%>

<br><p><i><a href="startexam.jsp">take another test</a></i></p>
<%
String st[]=new String[15];
for(int i=0;i<st.length;i++){
int j=i+1;
st[i]=request.getParameter("radio"+j);
System.out.println(st[i]);

}
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Testengine","root","1234");
PreparedStatement  ps=con.prepareStatement("Select Answer from questions where lang=?");
String q=(String)session.getAttribute("sub");
String user=(String)session.getAttribute("user");
ps.setString(1,q);
ResultSet rs=ps.executeQuery();
String ans="";
while(rs.next()){
ans+=rs.getString("Answer")+" ";
}
int count=0;
String answers[]=ans.split(" ");
for(int i=0;i<answers.length;i++){
if(st[i].equals(answers[i])){
count++;
}
}
System.out.println(count);
out.println("Your "+count+" answers are correct");
%>
</html>