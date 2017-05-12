<%@tag import="com.testengine.Dao.CategoeryDao"%>
<%@tag import="com.testengine.bean.Category"%>
<%@tag import="java.util.ArrayList"%>
<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<% 
out.println(" <table class='table' border='1'><thread><tr><th>Category Name</th><th>Status</th></tr></thread>");
ArrayList<Category> catlist = CategoeryDao.getcategory();

if(catlist.size()>0){
	for(Category cat : catlist){
		
		out.println("<tbody><tr><td>"+cat.getCategoryname()+"</td>");
		out.println("<td><select name='status'><option>Active</option><option>InActive</option></td><td><button class='btn btn-success'><a href='deleteCategory.jsp?key="+cat.getId()+"'>delete</a></button></td><td><button class='btn btn-warning'><a href='#'>Edit</a></button></td></tr><tbody>");
	}
}



out.println("</table>");
%>
