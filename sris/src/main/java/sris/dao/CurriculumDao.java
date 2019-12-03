package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class CurriculumDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_curriculum values('"+s.getCurriculum_sy()+"')";
		return template.update(sql);
	}

	public int delete(int curriculumid) {
		String sql = "delete from tbl_curriculum where id = "+curriculumid+"";
		return template.update(sql);
	}

	public int update(Student s) {
		String sql = "update tbl_curriculum set sy= '"+s.getCurriculum_sy()+"' where id='"+s.getCurriculum_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getCurriculum(){
		return template.query("SELECT id, sy FROM tbl_curriculum ORDER BY sy", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setCurriculum_id(rs.getInt(1));
				s.setCurriculum_sy(rs.getString(2));		
				return s;
			}
		});
	}
	

}
