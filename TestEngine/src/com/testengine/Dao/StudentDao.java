package com.testengine.Dao;

import com.testengine.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.testengine.bean.*;
public class StudentDao {

public static int addstudent(User u) throws SQLException{
int status=0;
Connection con=null;
PreparedStatement ps=null;
try{
con=ConnectionProvider.getCon();
ps=con.prepareStatement("insert into register values(?,?,?,?)");
ps.setString(1,u.getname());
ps.setString(2,u.getFname());
ps.setString(3,u.getMname());
ps.setString(4,u.getDob());
ps.setString(5,u.getAddress());
ps.setString(6,u.getmobile());
ps.setString(7,u.getemail());
ps.setString(8,u.getpass());
	
status=ps.executeUpdate();

}catch(Exception e){
	
}
ps.close();
con.close();
return status;
}

}
