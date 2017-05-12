<%@tag import="com.testengine.Dao.CategoeryDao"%>
<%@tag import="com.testengine.bean.Category"%>
<%@tag import="java.util.ArrayList"%>
<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@tag import="com.testengine.Dao.CategoeryDao" %>
<jsp:useBean id="obj" class="com.testengine.bean.Category"/>
<jsp:setProperty property="*" name="obj"/>

<% 
obj.setCategoryname(request.getParameter("categoryname"));
obj.setCategoryname(request.getParameter("status"));
int status=CategoeryDao.addCategory(obj);
if(status>0)
out.print("add category sucessfully done");
%>