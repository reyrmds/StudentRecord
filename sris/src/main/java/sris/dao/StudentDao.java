package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class StudentDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_student values('"+s.getStudent_number()+"','"+s.getStudent_name()+"','0')";
		return template.update(sql);
	}
	
	public int recordupdate(Student s) {
		String sql = "UPDATE tbl_record SET student_id='"+s.getStudent_id()+"' WHERE student_id='"+s.getRecord_id()+"'";
		return template.update(sql);
	}
	
	public int delete(int studentid) {
		String sql = "update tbl_student set isdeleted= '1' where id = "+studentid+"";
		return template.update(sql);
	}
	public int restore(int studentid) {
		String sql = "update tbl_student set isdeleted= '0' where id = "+studentid+"";
		return template.update(sql);
	}
	public int restoreall() {
		String sql = "update tbl_student set isdeleted= '0'";
		return template.update(sql);
	}
	
	public int update(Student s) {
		String sql = "update tbl_student set number= '"+s.getStudent_number()+"', name = '"+s.getStudent_name()+"' where id='"+s.getStudent_id()+"'";
		return template.update(sql);
	}
	
	
	public List<Student> getStudent(){
		return template.query("select * from tbl_student where  isdeleted='0' ORDER BY name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_number(rs.getString(2));
				s.setStudent_name(rs.getString(3));
				return s;
			}
		});
	}
	public List<Student> getsave(Student s){
		return template.query("select * from tbl_student where  isdeleted='0' AND number = '"+s.getStudent_number()+"' AND "
				+ "name = '"+s.getStudent_name()+"' ORDER BY name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_number(rs.getString(2));
				s.setStudent_name(rs.getString(3));
				return s;
			}
		});
	}
	public List<Student> getupdate(Student s){
		return template.query("select * from tbl_student where  isdeleted='0' AND id = '"+s.getStudent_id()+"'", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_number(rs.getString(2));
				s.setStudent_name(rs.getString(3));
				return s;
			}
		});
	}
	public List<Student> getStudentUpdate(){
		return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
			+"	(COUNT(tbl_record.id)) "
			+"	FROM   tbl_student LEFT JOIN "
			+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE tbl_student.isdeleted='0' "
			+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
			+"  ORDER BY tbl_student.name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_number(rs.getString(2));
				s.setStudent_name(rs.getString(3));
				s.setRecord_total(rs.getString(4));
				return s;
			}
		});
	}
	public List<Student> getDeletedStudent(){
		return template.query("select * from tbl_student where  isdeleted='1' ORDER BY name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_number(rs.getString(2));
				s.setStudent_name(rs.getString(3));
				return s;
			}
		});
	}
	
	public List<Student> getStudent2(){
		return template.query("select id,(+'('+number+')'+' - '+name) from tbl_student where  isdeleted='0' ORDER BY name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_name(rs.getString(2));
				return s;
			}
		});
	}
	
	public List<Student> getGrades(int studentid){
		return template.query("SELECT tbl_records.id, tbl_records.student_id, tbl_records.course_id, tbl_records.section_id, tbl_records.sy_id, tbl_records.sem_id, tbl_records.faculty_subject_id, tbl_records.grade, tbl_records.remarks, tbl_course.code, tbl_section.section, tbl_sy.sy, tbl_semester.semester, "
				+ "tbl_subject.code, tbl_subject.description, tbl_subject.units, tbl_faculty.name "
				+ "FROM   tbl_records INNER JOIN "
				+ "tbl_student ON tbl_records.student_id = tbl_student.id INNER JOIN "
				+ "tbl_course ON tbl_records.course_id = tbl_course.id INNER JOIN "
				+ "tbl_section ON tbl_records.section_id = tbl_section.id INNER JOIN "
				+ "tbl_sy ON tbl_records.sy_id = tbl_sy.id INNER JOIN "
				+ "tbl_semester ON tbl_records.sem_id = tbl_semester.id INNER JOIN "
				+ "tbl_faculty_subject ON tbl_records.faculty_subject_id = tbl_faculty_subject.id AND tbl_records.faculty_subject_id = tbl_faculty_subject.id INNER JOIN "
				+ "tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN "
				+ "tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id "
				+ "WHERE tbl_records.isdeleted='0' AND tbl_records.student_id="+studentid+"", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setRecord_id(rs.getInt(1));
				s.setStudent_id(rs.getInt(2));
				s.setCourse_id(rs.getInt(3));
				s.setSection_id(rs.getInt(4));
				s.setSy_id(rs.getInt(5));
				s.setSemester_id(rs.getInt(6));
				s.setFacultysubject_id(rs.getInt(7));
				
				s.setRecord_grade(rs.getString(8));
				s.setRecord_remarks(rs.getString(9));
				
				s.setCourse_code(rs.getString(10));
				s.setSection_section(rs.getString(11));
				s.setSy_sy(rs.getString(12));
				s.setSemester_semester(rs.getString(13));
				s.setSubject_code(rs.getString(14));
				s.setSubject_desc(rs.getString(15));
				s.setSubject_units(rs.getString(16));
				s.setFaculty_name(rs.getString(17));
				return s;
			}
		});
	}
	
	public List<Student> getDeletedGrades(){
		return template.query("SELECT tbl_records.id, tbl_records.student_id, tbl_records.course_id, tbl_records.section_id, tbl_records.sy_id, tbl_records.sem_id, tbl_records.faculty_subject_id, tbl_records.grade, tbl_records.remarks, tbl_course.code, tbl_section.section, "
				+ "tbl_sy.sy, tbl_semester.semester, "
				+ "tbl_subject.code, tbl_subject.description, tbl_subject.units, tbl_faculty.name "
				+ "FROM   tbl_records INNER JOIN "
				+ "tbl_student ON tbl_records.student_id = tbl_student.id INNER JOIN "
				+ "tbl_course ON tbl_records.course_id = tbl_course.id INNER JOIN "
				+ "tbl_section ON tbl_records.section_id = tbl_section.id INNER JOIN "
				+ "tbl_sy ON tbl_records.sy_id = tbl_sy.id INNER JOIN "
				+ "tbl_semester ON tbl_records.sem_id = tbl_semester.id INNER JOIN "
				+ "tbl_faculty_subject ON tbl_records.faculty_subject_id = tbl_faculty_subject.id AND tbl_records.faculty_subject_id = tbl_faculty_subject.id INNER JOIN "
				+ "tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN "
				+ "tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id "
				+ "WHERE tbl_records.isdeleted='1' ", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setRecord_id(rs.getInt(1));
				s.setStudent_id(rs.getInt(2));
				s.setCourse_id(rs.getInt(3));
				s.setSection_id(rs.getInt(4));
				s.setSy_id(rs.getInt(5));
				s.setSemester_id(rs.getInt(6));
				s.setFacultysubject_id(rs.getInt(7));
				
				s.setRecord_grade(rs.getString(8));
				s.setRecord_remarks(rs.getString(9));
				
				s.setCourse_code(rs.getString(10));
				s.setSection_section(rs.getString(11));
				s.setSy_sy(rs.getString(12));
				s.setSemester_semester(rs.getString(13));
				s.setSubject_code(rs.getString(14));
				s.setSubject_desc(rs.getString(15));
				s.setSubject_units(rs.getString(16));
				s.setFaculty_name(rs.getString(17));
				return s;
			}
		});
	}

	public List<Student> getStudentid(int studentid){
		return template.query("Select id,number, name from tbl_student where id="+studentid+"", new RowMapper<Student>(){
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
