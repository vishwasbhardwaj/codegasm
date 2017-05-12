package com.testengine.Dao;

import com.testengine.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.testengine.bean.*;

public class RegisterDao {

public static int register(User u) throws SQLException{
int status=0;
Connection con=null;
PreparedStatement ps=null;
try{
con=ConnectionProvider.getCon();
if(con==null){
System.out.println("connection fAIL");
}
System.out.println("................");
ps=con.prepareStatement(" INSERT INTO register(username,password,email,mobile) VALUES (?, ?, ?, ?)");

System.out.print("hellokkkkkkkkkkkkkkk");
ps.setString(1,u.getname());
System.out.println(u.getname());
ps.setString(2,u.getpass());
ps.setString(3,u.getemail());
ps.setString(4,u.getmobile());
	
System.out.println(".................");
status=ps.executeUpdate();
System.out.print(status);
}catch(Exception e){
	System.out.println(e);
}

return status;
}
public static boolean validate(String u,String p) throws SQLException{
	 ResultSet rs=null;
	PreparedStatement ps=null;
	Connection con=null;

	boolean status = false;
	try{

    con=ConnectionProvider.getCon();
	 ps=con.prepareStatement("select username,password from Register where username=? AND password=?");
	 ps.setString(1,u);
	 ps.setString(2,p);
	
    rs=ps.executeQuery();
          
   status=rs.next();
   
     
	}catch(Exception e){
		
		
	}

	return status;
	}

}