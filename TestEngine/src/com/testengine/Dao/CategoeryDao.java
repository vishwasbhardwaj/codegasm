package com.testengine.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.testengine.ConnectionProvider;
import com.testengine.bean.Category;


public class CategoeryDao {
	   static ResultSet rs=null;  
		static PreparedStatement ps=null;
		static Connection con=null;
		 static int status=0; 
	public static ArrayList<Category> getcategory() throws SQLException{
        
      ArrayList<Category> catlist = new ArrayList<>();
		try{
			
	     con=ConnectionProvider.getCon();
		 ps=con.prepareStatement("select id,categoryname,status from category");
		rs=ps.executeQuery();
		while(rs.next()){
			Category cat = new Category();
			cat.setId(rs.getInt(1));
			cat.setCategoryname(rs.getString(2));
			cat.setStatus(rs.getString(3));
			catlist.add(cat);
		}
       
         
		}finally{
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				rs.close();
			}if(con!=null){
				rs.close();
			}
			
		}
		return catlist;
		}
	
   	public static  int addCategory(Category c) throws SQLException{
 
    			try{
   	    con=ConnectionProvider.getCon();
   		ps=con.prepareStatement("insert into category values(?,?,?)");
   		ps.setInt(1, c.getId());
   		ps.setString(2,c.getCategoryname());
   		ps.setString(3,c.getStatus());
   		status=ps.executeUpdate();
   		
   		}
   		finally{
   			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				rs.close();
			}if(con!=null){
				rs.close();
			}
   		}
		return status;
	}
   	public static int delete(String c)throws SQLException{
   		try{
	     con=ConnectionProvider.getCon();
	     System.out.println(c);
		 ps=con .prepareStatement("delete from category where id=?" );
		 ps.setString(1, c);
		 status=ps.executeUpdate();
   		}
   		finally{
   			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				rs.close();
			}if(con!=null){
				rs.close();
			}
   		}
		return status;
   	}
}		

