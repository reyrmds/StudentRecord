package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class SyDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_sy values('"+s.getSy_sy()+"')";
		return template.update(sql);
	}
	
	
	public int delete(int syid) {
		String sql = "delete from tbl_sy where id = "+syid+"";
		return template.update(sql);
	}


	public int update(Student s) {
		String sql = "update tbl_sy set sy = '"+s.getSy_sy()+"' "
				+ " where id='"+s.getSy_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getsy(){
		return template.query("SELECT id, sy  FROM  tbl_sy ORDER BY sy", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSy_id(rs.getInt(1));
				s.setSy_sy(rs.getString(2));
	
				return s;
			}
		});
	}	
}
