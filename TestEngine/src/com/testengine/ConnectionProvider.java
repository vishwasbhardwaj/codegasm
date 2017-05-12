package com.testengine;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class ConnectionProvider {
private static Connection con=null;
static{
try{
Class.forName(Provider.DRIVER);
con=DriverManager.getConnection(Provider.CONNECTION_URL,Provider.USERNAME,Provider.PASSWORD);
}catch(Exception e){}
}

public static Connection getCon(){
	return con;
}

public static void clean(Connection con, PreparedStatement ps)
{
  try
  { if ( ps != null )  ps.close();
    if ( con != null) con.close();
  }
   catch(Exception ex)
  { System.out.println(ex.getMessage()); }
}

}
