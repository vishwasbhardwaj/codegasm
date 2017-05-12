<%@page import="com.testengine.Dao.CategoeryDao"%>
<%@page import="com.testengine.bean.Category"%>

<%@page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.testengine.Dao.CategoeryDao" %>
<jsp:useBean id="obj" class="com.testengine.bean.Category"/>
<jsp:setProperty property="*" name="obj"/>

<% 

String  r=request.getParameter("key");
System.out.println(r);

int status=CategoeryDao.delete(r);
if(status>0){
out.print("delete category sucessfully done");
}
else
{
out.print("delete is not done");
}
%>