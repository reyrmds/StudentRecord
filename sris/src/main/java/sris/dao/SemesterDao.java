package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class SemesterDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_semester values('"+s.getSemester_semester()+"')";
		return template.update(sql);
	}
	
	
	public int delete(int semesterid) {
		String sql = "delete from tbl_semester where id = "+semesterid+"";
		return template.update(sql);
	}


	public int update(Student s) {
		String sql = "update tbl_semester set semester = '"+s.getSemester_semester()+"' "
				+ " where id='"+s.getSemester_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getsemester(){
		return template.query("SELECT id, semester  FROM  tbl_semester ORDER BY semester", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSemester_id(rs.getInt(1));
				s.setSemester_semester(rs.getString(2));
	
				return s;
			}
		});
	}	
}
