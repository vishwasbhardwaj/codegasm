<%@page import="com.testengine.Dao.RegisterDao" %>
<jsp:useBean id="obj" class="com.testengine.bean.User"/>
<jsp:setProperty property="*" name="obj"/>
<%
obj.setname(request.getParameter("username"));
obj.setpass(request.getParameter("password"));
obj.setemail(request.getParameter("email"));
obj.setmobile(request.getParameter("mobile"));

int status=RegisterDao.register(obj);
if(status>0)
{
out.print("You are successfully registered");

%>
<jsp:forward page="login.html"/> 
<%
}
else
{
	out.print("not register");
}
%>
