package sris.util;
 
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnection {
 
public static Connection createConnection()
{
Connection con = null;
String url = "jdbc:sqlserver://localhost:1433;databaseName=sris_db;integratedSecurity=true;";
 
try
{
try
{
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (ClassNotFoundException e)
{
e.printStackTrace();
}
con = DriverManager.getConnection(url);
System.out.println("Post establishing a DB connection - "+con);
}
catch (Exception e)
{
e.printStackTrace();
}
 
return con;
}
}