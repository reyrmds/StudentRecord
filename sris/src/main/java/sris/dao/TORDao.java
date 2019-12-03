package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class TORDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<Student> getStudent(Student s){
		return template.query("select * from tbl_student where id='"+s.getStudent_id()+"' AND isdeleted='0'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_number(rs.getString(2));
				s.setStudent_name(rs.getString(3));
				return s;
			}
		});
	}
	
	
}
