package com.testengine.Dao;

import com.testengine.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.testengine.bean.*;
public class LoginDao {

	public static boolean validate(Login u) throws SQLException{
		 ResultSet rs=null;
		PreparedStatement ps=null;
		Connection con=null;
       
		boolean status = false;
		try{
	
	     con=ConnectionProvider.getCon();
		 ps=con.prepareStatement("select name,password from login where name=? AND password=?");
		 ps.setString(1,u.getUsername());
		 ps.setString(2,u.getPassword());
		 System.out.println(u.getUsername());
		 System.out.println(u.getPassword());
	     rs=ps.executeQuery();
	           
        status=rs.next();
        
          
		}catch(Exception e){
			
			
		}
	
		return status;
		}

	
	
		}
