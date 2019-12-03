package sris.dao;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import sris.model.LoginBean;
import sris.util.DBConnection;
 
public class LoginDao {
 
public String authenticateUser(LoginBean loginBean)
{
 String userName = loginBean.getUserName();
 String password = loginBean.getPassword();

 
 
 Connection con = null;
 Statement statement = null;
 ResultSet resultSet = null;
 String emailDB = "";
 String userNameDB = "";
 String passwordDB = "";
 String roleDB = "";

	 try
	 {	 
		 con = DBConnection.createConnection();
		 statement = con.createStatement();
		 resultSet = statement.executeQuery("select username,email,password,role from tbl_users where isdeleted='0'");
		 
		 while(resultSet.next())
		 {
			 userNameDB = resultSet.getString("username");
			 passwordDB = resultSet.getString("password");
			 emailDB = resultSet.getString("email");
			 roleDB = resultSet.getString("role");
			 
			 if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Admin"))
			 return "Admin_Role";
			 else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("User"))
			 return "User_Role";
			 else if(userName.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("Admin"))
			 return "Admin_Role";
			 else if(userName.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("User"))
			 return "User_Role";			 
		 }		 
	 }
	 catch(SQLException e)
	 {
		 e.printStackTrace();
		 
	 } 
	 return "Invalid user credentials";
	}
}