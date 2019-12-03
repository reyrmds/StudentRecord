package sris.dao;


import org.springframework.jdbc.core.JdbcTemplate;

import sris.model.Student;

public class SubjectCurriculumDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into ref_subject_curriculum values('"+s.getCurriculum_id()+"','"+s.getCourse_id()+"','"+s.getSemester_id()+"','"+s.getSy_id()+"','"+s.getFacultysubject_id()+"')";
		return template.update(sql);
	}
	
	
	public int delete(int refid) {
		String sql = "delete from ref_subject_curriculum where id = "+refid+"";
		return template.update(sql);
	}


	public int update(Student s) {
		String sql = "update ref_subject_curriculum set curriculum_id= '"+s.getCourse_code()+"', "
				+ " course_id = '"+s.getCourse_id()+"' , "
				+ " sem_id = '"+s.getSemester_id()+"' , "
				+ " sy_id = '"+s.getSy_id()+"' , "
				+ " faculty_subject_id = '"+s.getFacultysubject_id()+"'  "
				+ " where id='"+s.getRef_id()+"'";
		return template.update(sql);
	}
	
}
