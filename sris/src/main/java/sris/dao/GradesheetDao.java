package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class GradesheetDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save_record(Student s) {
		String sql = "insert into tbl_records (grade,remarks,student_id,course_id,section_id,sy_id,sem_id,faculty_subject_id,isdeleted) "
				+ "values('"+s.getRecord_grade()+"','"+s.getRecord_remarks()+"','"+s.getStudent_id()+"', "
				+ "'"+s.getCourse_id()+"','"+s.getSection_id()+"','"+s.getSy_id()+"','"+s.getSemester_id()+"','"+s.getFacultysubject_id()+"','0')";
		return template.update(sql);
	}
	
	public int update_record(Student s) {
		String sql = "update tbl_records set student_id = '"+s.getStudent_id()+"', grade = '"+s.getRecord_grade()+"', "
				+ "remarks = '"+s.getRecord_remarks()+"'  WHERE id = '"+s.getRecord_id()+"'";
		return template.update(sql);
	}
	
	public int delete_record(Student s) {
		String sql = "UPDATE tbl_records SET isdeleted='1' WHERE id = '"+s.getRecord_id()+"'";	
		return template.update(sql);
	}
	
	
	public int save(Student s) {
		String sql = "insert into tbl_records (course_id,section_id,sy_id,sem_id,faculty_subject_id,isdeleted) values('"+s.getCourse_id()+"',"
				+ "'"+s.getSection_id()+"','"+s.getSy_id()+"','"+s.getSemester_id()+"','"+s.getFacultysubject_id()+"','0')";
		return template.update(sql);
	}
	
	public int update(Student s) {
		String sql = "update tbl_records set course_id = '"+s.getCourse_id()+"' , section_id = '"+s.getSection_id()+"' , "
				+ "sy_id = '"+s.getSy_id()+"' , sem_id = '"+s.getSemester_id()+"', faculty_subject_id = '"+s.getFacultysubject_id()+"' "
				+ "where course_id = '"+s.getGcourse_id()+"' AND "
				+ "section_id = '"+s.getGsection_id()+"' AND "
				+ "sy_id = '"+s.getGsy_id()+"' AND "
				+ "sem_id = '"+s.getGsemester_id()+"' AND "
				+ "faculty_subject_id = '"+s.getGfacultysubject_id()+"' ";
		System.out.println(sql);
		return template.update(sql);
	}
	
	public List<Student> getStudent(){
		return template.query("select id, (+'('+number+') '+name) from tbl_student where  isdeleted='0' ORDER BY name", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setStudent_name(rs.getString(2));
				return s;
			}
		});
	}
	public List<Student> getRecord(Student s){
		return template.query("SELECT DISTINCT  tbl_course.id, tbl_section.id , tbl_sy.id, tbl_semester.id, tbl_faculty_subject.id, "
				+ "tbl_subject.code, tbl_subject.description, tbl_subject.units, tbl_course.code, tbl_section.section, tbl_semester.semester, tbl_sy.sy, tbl_faculty.name "
				+ "FROM   tbl_records INNER JOIN "
				+ "tbl_faculty_subject ON tbl_records.faculty_subject_id = tbl_faculty_subject.id AND tbl_records.faculty_subject_id = tbl_faculty_subject.id INNER JOIN "
				+ "tbl_course ON tbl_records.course_id = tbl_course.id INNER JOIN "
				+ "tbl_section ON tbl_records.section_id = tbl_section.id INNER JOIN "
				+ "tbl_semester ON tbl_records.sem_id = tbl_semester.id INNER JOIN "
				+ "tbl_sy ON tbl_records.sy_id = tbl_sy.id INNER JOIN "
				+ "tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id INNER JOIN "
				+ "tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id "
				+ "where tbl_records.faculty_subject_id='"+s.getFacultysubject_id()+"' and tbl_records.isdeleted='0'"
				+ "ORDER BY  tbl_subject.code ", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setCourse_id(rs.getInt(1));
				s.setSection_id(rs.getInt(2));
				s.setSy_id(rs.getInt(3));
				s.setSemester_id(rs.getInt(4));
				s.setFacultysubject_id(rs.getInt(5));
				s.setSubject_code(rs.getString(6));
				s.setSubject_desc(rs.getString(7));
				s.setSubject_units(rs.getString(8));
				s.setCourse_code(rs.getString(9));
				s.setSection_section(rs.getString(10));
				s.setSemester_semester(rs.getString(11));
				s.setSy_sy(rs.getString(12));
				s.setFaculty_name(rs.getString(13));
				return s;
			}
		});
	}

	
	public List<Student> getGradesheet(int courseid,int sectionid,int syid,int semesterid,int facultysubjectid){
		return template.query("SELECT tbl_records.id, tbl_records.student_id, tbl_records.course_id, tbl_records.section_id, tbl_records.sy_id, tbl_records.sem_id, tbl_records.faculty_subject_id, tbl_records.grade, tbl_records.remarks, tbl_course.code, tbl_section.section, tbl_sy.sy, tbl_semester.semester, "
				+ "tbl_subject.code, tbl_subject.description, tbl_subject.units, tbl_faculty.name,"
				+ "tbl_student.number,tbl_student.name "
				+ "FROM   tbl_records INNER JOIN "
				+ "tbl_student ON tbl_records.student_id = tbl_student.id INNER JOIN "
				+ "tbl_course ON tbl_records.course_id = tbl_course.id INNER JOIN "
				+ "tbl_section ON tbl_records.section_id = tbl_section.id INNER JOIN "
				+ "tbl_sy ON tbl_records.sy_id = tbl_sy.id INNER JOIN "
				+ "tbl_semester ON tbl_records.sem_id = tbl_semester.id INNER JOIN "
				+ "tbl_faculty_subject ON tbl_records.faculty_subject_id = tbl_faculty_subject.id AND tbl_records.faculty_subject_id = tbl_faculty_subject.id INNER JOIN "
				+ "tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN "
				+ "tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id "
				+ "WHERE tbl_records.isdeleted='0' AND tbl_records.course_id="+courseid+" "
				+ "AND tbl_records.section_id="+sectionid+" AND tbl_records.sem_id="+semesterid+" AND tbl_records.sy_id="+syid+" "
				+ "AND tbl_records.faculty_subject_id="+facultysubjectid+" ", new RowMapper<Student>(){
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
				s.setStudent_number(rs.getString(18));
				s.setStudent_name(rs.getString(19));
				return s;
				
			}
		});
	}
	
	public List<Student> getcurriculum(){
		return template.query("SELECT id,sy  FROM tbl_curriculum  ORDER BY sy", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setCurriculum_id(rs.getInt(1));
				s.setCurriculum_sy(rs.getString(2));
				return s;
			}
		});
	}
	
	
	public List<Student> getcourse(){
		return template.query("SELECT id,code  FROM tbl_course  ORDER BY course", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setCourse_id(rs.getInt(1));
				s.setCourse_course(rs.getString(2));
				return s;
			}
		});
	}
	public List<Student> getsection(){
		return template.query("SELECT id,section  FROM tbl_section  ORDER BY section", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSection_id(rs.getInt(1));
				s.setSection_section(rs.getString(2));
				return s;
			}
		});
	}
	public List<Student> getGradesheet1(int courseid,int sectionid,int syid,int semesterid,int facultysubjectid){
		return template.query("SELECT top 1 tbl_course.code, tbl_section.section, tbl_sy.sy, tbl_semester.semester, "
				+ "tbl_subject.code, tbl_subject.description, tbl_subject.units, tbl_faculty.name, "
				+ "tbl_records.course_id, tbl_records.section_id, tbl_records.sy_id, tbl_records.sem_id, tbl_records.faculty_subject_id "
				+ "FROM   tbl_records INNER JOIN "
				+ "tbl_student ON tbl_records.student_id = tbl_student.id INNER JOIN "
				+ "tbl_course ON tbl_records.course_id = tbl_course.id INNER JOIN "
				+ "tbl_section ON tbl_records.section_id = tbl_section.id INNER JOIN "
				+ "tbl_sy ON tbl_records.sy_id = tbl_sy.id INNER JOIN "
				+ "tbl_semester ON tbl_records.sem_id = tbl_semester.id INNER JOIN "
				+ "tbl_faculty_subject ON tbl_records.faculty_subject_id = tbl_faculty_subject.id AND tbl_records.faculty_subject_id = tbl_faculty_subject.id INNER JOIN "
				+ "tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN "
				+ "tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id "
				+ "WHERE  tbl_records.course_id="+courseid+" "
				+ "AND tbl_records.section_id="+sectionid+" AND tbl_records.sem_id="+semesterid+" AND tbl_records.sy_id="+syid+" "
				+ "AND tbl_records.faculty_subject_id="+facultysubjectid+" ", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();

				s.setCourse_code(rs.getString(1));
				s.setSection_section(rs.getString(2));
				s.setSy_sy(rs.getString(3));
				s.setSemester_semester(rs.getString(4));
				s.setSubject_code(rs.getString(5));
				s.setSubject_desc(rs.getString(6));
				s.setSubject_units(rs.getString(7));
				s.setFaculty_name(rs.getString(8));
				
				s.setCourse_id(rs.getInt(9));
				s.setSection_id(rs.getInt(10));
				s.setSy_id(rs.getInt(11));
				s.setSemester_id(rs.getInt(12));
				s.setFacultysubject_id(rs.getInt(13));
				return s;
				
			}
		});
	}
	

	
	public List<Student> getfacultysubject(){
		return template.query("SELECT  tbl_faculty_subject.id, tbl_subject.code, tbl_subject.description, tbl_subject.units, "
				+ "tbl_faculty.name"
			 +" FROM   tbl_faculty_subject INNER JOIN "
			 +" tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id INNER JOIN"
			 +" tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id order by tbl_subject.code", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setFacultysubject_id(rs.getInt(1));
				s.setSubject_code(rs.getString(2));
				s.setSubject_desc(rs.getString(3));
				s.setSubject_units(rs.getString(4));
				s.setFaculty_name(rs.getString(5));
				return s;
			}
		});
	}
	public List<Student> getsemester(){
		return template.query("SELECT id,semester  FROM tbl_semester  ORDER BY semester", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSemester_id(rs.getInt(1));
				s.setSemester_semester(rs.getString(2));
				return s;
			}
		});
	}
	public List<Student> getsy(){
		return template.query("SELECT id,sy  FROM tbl_sy  ORDER BY sy", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSy_id(rs.getInt(1));
				s.setSy_sy(rs.getString(2));
				return s;
			}
		});
	}
	
	
	
}
