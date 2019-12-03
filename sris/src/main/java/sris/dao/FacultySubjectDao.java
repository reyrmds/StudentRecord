package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class FacultySubjectDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_faculty_subject values('"+s.getFaculty_id()+"','"+s.getSubject_id()+"','0')";
		return template.update(sql);
	}
	
	public int delete(int facultysubjectid) {
		String sql = "update tbl_faculty_subject set isdeleted= '1' where id = "+facultysubjectid+"";
		return template.update(sql);
	}
	public int restore(int facultysubjectid) {
		String sql = "update tbl_faculty_subject set isdeleted= '0' where id = "+facultysubjectid+"";
		return template.update(sql);
	}
	public int restoreall() {
		String sql = "update tbl_faculty_subject set isdeleted= '0'";
		return template.update(sql);
	}
	
	public int update(Student s) {
		String sql = "update tbl_faculty_subject set faculty_id = '"+s.getFaculty_id()+"',  subject_id = '"+s.getSubject_id()+"'  where id ='"+s.getFacultysubject_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getFacultySubject(){
		return template.query("SELECT tbl_faculty_subject.id, tbl_faculty_subject.faculty_id, tbl_faculty_subject.subject_id, tbl_faculty.name, +'('+tbl_subject.code+') ' +tbl_subject.description FROM tbl_faculty_subject INNER JOIN tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id WHERE tbl_faculty_subject.isdeleted='0'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFacultysubject_id(rs.getInt(1));
				s.setFaculty_id(rs.getInt(2));
				s.setSubject_id(rs.getInt(3));
				s.setFaculty_name(rs.getString(4));
				s.setSubject_desc(rs.getString(5));
				return s;
			}
		});
	}
	public List<Student> getDeletedFacultySubject(){
		return template.query("SELECT tbl_faculty_subject.id, tbl_faculty_subject.faculty_id, tbl_faculty_subject.subject_id, tbl_faculty.name,+'('+tbl_subject.code+') ' +tbl_subject.description FROM tbl_faculty_subject INNER JOIN tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id WHERE tbl_faculty_subject.isdeleted='1'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFacultysubject_id(rs.getInt(1));
				s.setFaculty_id(rs.getInt(2));
				s.setSubject_id(rs.getInt(3));
				s.setFaculty_name(rs.getString(4));
				s.setSubject_desc(rs.getString(5));
				return s;
			}
		});
	}
	
	public List<Student> getFacultySubjectRecord(){
		return template.query("SELECT DISTINCT tbl_faculty.name, +'('+tbl_subject.code+') '+tbl_subject.description, tbl_faculty.id, tbl_subject.id FROM   tbl_record INNER JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id INNER JOIN tbl_subject ON tbl_record.subject_id = tbl_subject.id WHERE (tbl_faculty.name != '-'  AND tbl_record.isdeleted='0' AND tbl_faculty.isdeleted='0') ORDER BY tbl_faculty.name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFaculty_name(rs.getString(1));
				s.setSubject_desc(rs.getString(2));
				s.setFaculty_id(rs.getInt(3));
				s.setSubject_id(rs.getInt(4));
				return s;
			}
		});
	}

	
	
}
