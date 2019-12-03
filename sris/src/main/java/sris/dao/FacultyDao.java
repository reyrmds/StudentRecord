package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class FacultyDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_faculty values('"+s.getFaculty_first()+"'+' '+'"+s.getFaculty_middle()+"'+'. '+'"+s.getFaculty_last()+"','0')";
		return template.update(sql);
	}
	
	public int delete(int facultyid) {
		String sql = "update tbl_faculty set isdeleted= '1' where id = "+facultyid+"";
		return template.update(sql);
	}
	public int restore(int facultyid) {
		String sql = "update tbl_faculty set isdeleted= '0' where id = "+facultyid+"";
		return template.update(sql);
	}
	public int restoreall() {
		String sql = "update tbl_faculty set isdeleted= '0'";
		return template.update(sql);
	}
	
	public int update(Student s) {
		String sql = "update tbl_faculty set name= '"+s.getFaculty_name()+"' where id='"+s.getFaculty_id()+"'";
		return template.update(sql);
	}
	public int recordupdate(Student s) {
		String sql = "update tbl_record set faculty_id = '"+s.getFaculty_id()+"' where faculty_id='"+s.getRecord_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getFacultyUpdate(){
		return template.query("SELECT DISTINCT tbl_faculty.id, tbl_faculty.name, "
			+"	(COUNT(tbl_record.id)) "
			+"	FROM   tbl_faculty LEFT JOIN "
			+"	tbl_record ON tbl_faculty.id = tbl_record.faculty_id WHERE tbl_faculty.isdeleted='0' "
			+"	GROUP BY tbl_faculty.id, tbl_faculty.name ", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFaculty_id(rs.getInt(1));
				s.setFaculty_name(rs.getString(2));
				s.setRecord_total(rs.getString(3));
				return s;
			}
		});
	}
	
	public List<Student> getFaculty(){
		return template.query("SELECT distinct name,id FROM tbl_faculty where  isdeleted='0' GROUP BY id,name ORDER BY name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFaculty_id(rs.getInt(2));
				s.setFaculty_name(rs.getString(1));
				return s;
			}
		});
	}
	
	public List<Student> getDeletedFaculty(){
		return template.query("SELECT distinct name,id FROM tbl_faculty where  isdeleted='1' GROUP BY id,name ORDER BY name ", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFaculty_id(rs.getInt(2));
				s.setFaculty_name(rs.getString(1));
				return s;
			}
		});
	}

	
	
}
