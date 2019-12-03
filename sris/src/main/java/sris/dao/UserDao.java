package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class UserDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_users values('"+s.getUser_full()+"','"+s.getUser_email()+"','"+s.getUser_name()+"','"+s.getUser_pass()+"','"+s.getUser_role()+"','0')";
		return template.update(sql);
	}
	
	public int delete(int userid) {
		String sql = "update tbl_users set isdeleted= '1' where id = "+userid+"";
		return template.update(sql);
	}
	public int restore(int userid) {
		String sql = "update tbl_users set isdeleted= '0' where id = "+userid+"";
		return template.update(sql);
	}
	public int restoreall() {
		String sql = "update tbl_users set isdeleted= '0'";
		return template.update(sql);
	}
	
	public int update(Student s) {
		String sql = "update tbl_users set fullname='"+s.getUser_full()+"' ,email = '"+s.getUser_email()+"' ,username= '"+s.getUser_name()+"' ,password = '"+s.getUser_pass()+"' ,role = '"+s.getUser_role()+"'  where id='"+s.getUser_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getUsers(){
		return template.query("SELECT id, fullname, email, username, password, role FROM   tbl_users WHERE isdeleted='0'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setUser_id(rs.getInt(1));
				s.setUser_full(rs.getString(2));
				s.setUser_email(rs.getString(3));
				s.setUser_name(rs.getString(4));
				s.setUser_pass(rs.getString(5));
				s.setUser_role(rs.getString(6));
				return s;
			}
		});
	}
	
	public List<Student> getDeletedUsers(){
		return template.query("SELECT id, fullname, email, username, password, role FROM   tbl_users WHERE isdeleted='1'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setUser_id(rs.getInt(1));
				s.setUser_full(rs.getString(2));
				s.setUser_email(rs.getString(3));
				s.setUser_name(rs.getString(4));
				s.setUser_pass(rs.getString(5));
				s.setUser_role(rs.getString(6));
				return s;
			}
		});
	}
	
	public List<Student> getUser(Student s){
		return template.query("select username from tbl_users where username='"+s.getUser_name()+"' AND password='"+s.getUser_pass()+"'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setUser_name(rs.getString(1));
				return s;
			}
		});
	}
	public List<Student> getRole(Student s){
		return template.query("select role from tbl_users where username='"+s.getUser_name()+"' AND password='"+s.getUser_pass()+"'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setUser_role(rs.getString(1));
				return s;
			}
		});
	}

	
	
}
