package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class SectionDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_section values('"+s.getSection_section()+"')";
		return template.update(sql);
	}
	
	
	public int delete(int sectionid) {
		String sql = "delete from tbl_section where id = "+sectionid+"";
		return template.update(sql);
	}


	public int update(Student s) {
		String sql = "update tbl_section set section = '"+s.getSection_section()+"' "
				+ " where id='"+s.getSection_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getsection(){
		return template.query("SELECT id, section  FROM  tbl_section ORDER BY section", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSection_id(rs.getInt(1));
				s.setSection_section(rs.getString(2));
	
				return s;
			}
		});
	}	
}
