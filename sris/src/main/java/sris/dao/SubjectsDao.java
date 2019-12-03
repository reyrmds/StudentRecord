package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class SubjectsDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Student s) {
		String sql = "insert into tbl_subject values('"+s.getSubject_code()+"','"+s.getSubject_desc()+"','"+s.getSubject_units()+"','0')";
		return template.update(sql);
	}
	
	
	public List<Student> getSubjectUpdate(){
		return template.query("SELECT DISTINCT tbl_subject.id,tbl_subject.code, tbl_subject.description,tbl_subject.units, "
			+"	(COUNT(tbl_record.id)) "
			+"	FROM   tbl_subject LEFT JOIN "
			+"	tbl_record ON tbl_subject.id = tbl_record.subject_id WHERE tbl_subject.isdeleted='0' "
			+"	GROUP BY tbl_subject.id,tbl_subject.code, tbl_subject.description,tbl_subject.units ", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSubject_id(rs.getInt(1));
				s.setSubject_code(rs.getString(2));
				s.setSubject_desc(rs.getString(3));
				s.setSubject_units(rs.getString(4));
				s.setRecord_total(rs.getString(5));
				return s;
			}
		});
	}
	public int recordupdate(Student s) {
		String sql = "UPDATE tbl_record SET subject_id='"+s.getSubject_id()+"' WHERE subject_id='"+s.getRecord_id()+"'";
		return template.update(sql);
	}
	
	public int delete(int subjectid) {
		String sql = "update tbl_subject set isdeleted= '1' where id = "+subjectid+"";
		return template.update(sql);
	}
	public int restore(int subjectid) {
		String sql = "update tbl_subject set isdeleted= '0' where id = "+subjectid+"";
		return template.update(sql);
	}
	public int restoreall() {
		String sql = "update tbl_subject set isdeleted= '0'";
		return template.update(sql);
	}
	public int update(Student s) {
		String sql = "update tbl_subject set code= '"+s.getSubject_code()+"', "
				+ " description = '"+s.getSubject_desc()+"',"
				+ " units='"+s.getSubject_units()+"'  "
				+ " where id='"+s.getSubject_id()+"'";
		return template.update(sql);
	}
	
	public List<Student> getSubject(){
		return template.query("SELECT id, code,description,units  FROM   tbl_subject where  isdeleted='0' ORDER BY code", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSubject_id(rs.getInt(1));
				s.setSubject_code(rs.getString(2));
				s.setSubject_desc(rs.getString(3));
				s.setSubject_units(rs.getString(4));			
				return s;
			}
		});
	}
	
	public List<Student> getDeletedSubject(){
		return template.query("SELECT id, code,description,units  FROM   tbl_subject where  isdeleted='1' ORDER BY code", new RowMapper<Student>(){
			public Student mapRow(ResultSet rs, int row)  throws SQLException{
				Student s = new Student();
				s.setSubject_id(rs.getInt(1));
				s.setSubject_code(rs.getString(2));
				s.setSubject_desc(rs.getString(3));
				s.setSubject_units(rs.getString(4));
				return s;
			}
		});
	}

	
	
}
