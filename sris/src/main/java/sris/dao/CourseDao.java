package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class CourseDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_course values('"+s.getCourse_code()+"','"+s.getCourse_course()+"')";
		return template.update(sql);
	}
	
	
	public int delete(int courseid) {
		String sql = "delete from tbl_course where id = "+courseid+"";
		return template.update(sql);
	}


	public int update(Student s) {
		String sql = "update tbl_course set code= '"+s.getCourse_code()+"', "
				+ " course = '"+s.getCourse_course()+"' "
				+ " where id='"+s.getCourse_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getCourse(){
		return template.query("SELECT id, code,course  FROM  tbl_course ORDER BY code", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setCourse_id(rs.getInt(1));
				s.setCourse_code(rs.getString(2));
				s.setCourse_course(rs.getString(3));		
				return s;
			}
		});
	}	
}
