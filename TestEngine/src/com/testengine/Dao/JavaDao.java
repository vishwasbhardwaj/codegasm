package com.testengine.Dao;


import com.testengine.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JavaDao {

public static ArrayList java() throws SQLException{

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
ArrayList ls=new ArrayList();
try{
con=ConnectionProvider.getCon();
ps=con.prepareStatement("select question,A,B,C,D from questions");
rs=ps.executeQuery();
while(rs.next()){
 ls.add(rs.getString(1));
 ls.add(rs.getString(2));
 ls.add(rs.getString(3));
 ls.add(rs.getString(4));
}

	


}catch(Exception e){
	
}
ps.close();
con.close();
  return ls;
}

}
