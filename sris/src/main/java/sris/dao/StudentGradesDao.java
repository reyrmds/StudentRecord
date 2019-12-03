package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class StudentGradesDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	
	public int save(Student s) {
		String sql = "INSERT INTO tbl_records (course_id,section_id,grade,remarks,sem_id,sy_id,student_id,faculty_subject_id,isdeleted)"
				+ " values ('"+s.getCourse_id()+"','"+s.getSection_id()+"','"+s.getRecord_grade()+"','"+s.getRecord_remarks()+"','"+s.getSemester_id()+"',"
						+ "'"+s.getSy_id()+"','"+s.getStudent_id()+"','"+s.getFacultysubject_id()+"',"
								+ "'0')";
		return template.update(sql);		
	}
	
	public int delete(int recordid) {
		String sql = "update tbl_records set isdeleted= '1' where id = "+recordid+"";
		return template.update(sql);
	}

	public int update(Student s) {
		String sql = "update tbl_records set course_id='"+s.getCourse_id()+"',"
				+ "section_id='"+s.getSection_id()+"', grade='"+s.getRecord_grade()+"',"
				+ "remarks='"+s.getRecord_remarks()+"',sem_id='"+s.getSemester_id()+"',"
				+ "sy_id='"+s.getSy_id()+"',student_id='"+s.getStudent_id()+"',"
				+ "faculty_subject_id='"+s.getFacultysubject_id()+"',isdeleted='0' where id='"+s.getRecord_id()+"'";
		return template.update(sql);
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
	
	public List<Student> getcurriculumsubjects(){
		return template.query("SELECT ref_subject_curriculum.id, ref_subject_curriculum.curriculum_id, ref_subject_curriculum.course_id, "
				+ "ref_subject_curriculum.sem_id, ref_subject_curriculum.sy_id, ref_subject_curriculum.faculty_subject_id, tbl_course.code, "
				+ "tbl_subject.code AS Expr1, tbl_subject.description, "
				+ "tbl_subject.units, tbl_faculty.name, tbl_sy.sy, tbl_semester.semester, tbl_curriculum.sy "
				+ "FROM   ref_subject_curriculum INNER JOIN "
				+ "tbl_curriculum ON ref_subject_curriculum.curriculum_id = tbl_curriculum.id INNER JOIN "
				+ "tbl_course ON ref_subject_curriculum.course_id = tbl_course.id INNER JOIN "
				+ "tbl_semester ON ref_subject_curriculum.sem_id = tbl_semester.id INNER JOIN "
				+ "	tbl_sy ON ref_subject_curriculum.sy_id = tbl_sy.id INNER JOIN "
				+ "	tbl_faculty_subject ON ref_subject_curriculum.faculty_subject_id = tbl_faculty_subject.id INNER JOIN"
				+ "	tbl_subject ON tbl_faculty_subject.subject_id = tbl_subject.id INNER JOIN"
				+ "	tbl_faculty ON tbl_faculty_subject.faculty_id = tbl_faculty.id", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setRef_id(rs.getInt(1));
				s.setCurriculum_id(rs.getInt(2));
				s.setCourse_id(rs.getInt(3));
				s.setSemester_id(rs.getInt(4));
				s.setSy_id(rs.getInt(5));
				s.setFacultysubject_id(rs.getInt(6));
				s.setCourse_code(rs.getString(7));
				s.setSubject_code(rs.getString(8));
				s.setSubject_desc(rs.getString(9));
				s.setSubject_units(rs.getString(10));
				s.setFaculty_name(rs.getString(11));
				s.setSy_sy(rs.getString(12));		
				s.setSemester_semester(rs.getString(13));			
				s.setCurriculum_sy(rs.getString(14));
				return s;
			}
		});
	}
	public int restore(int recordid) {
		String sql = "update tbl_records set isdeleted= '0' where id = "+recordid+"";
		return template.update(sql);
	}
	public int restoreall() {
		String sql = "update tbl_records set isdeleted= '0'";
		return template.update(sql);
	}
	
}
