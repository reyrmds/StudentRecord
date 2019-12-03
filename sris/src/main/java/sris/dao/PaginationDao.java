package sris.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import sris.model.Student;

public class PaginationDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public List<Student> pagination(String pagination){
		System.out.println(pagination);
		if(pagination.equals("A-B")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
			+"	(COUNT(tbl_record.id)) "
			+"	FROM   tbl_student LEFT JOIN "
			+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE  name LIKE 'A%' OR name LIKE 'B%' "
			+"  AND  tbl_student.isdeleted='0' "
			+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
			+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("C-D")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'C%' OR name LIKE 'D%'  "
					+" AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("E-F")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'E%' OR name LIKE 'F%'  "
					+"  AND tbl_student.isdeleted='0'"
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("G-H")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'G%' OR name LIKE 'H%' "
					+"  AND tbl_student.isdeleted='0'"
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("I-J")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'I%' OR name LIKE 'J%' "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("K-L")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'K%' OR name LIKE 'L%' "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("M-N")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'M%' OR name LIKE 'N%'  "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("O-P")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'O%' OR name LIKE 'P%' "
					+"  AND tbl_student.isdeleted='0'  "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("Q-R")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'Q%' OR name LIKE 'R%'  "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("S-T")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'S%' OR name LIKE 'T%'  "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		if(pagination.equals("U-V")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'U%' OR name LIKE 'V%' "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		
		if(pagination.equals("W-Z")){
			return template.query("SELECT DISTINCT tbl_student.id,tbl_student.number, tbl_student.name, "
					+"	(COUNT(tbl_record.id)) "
					+"	FROM   tbl_student LEFT JOIN "
					+"	tbl_record ON tbl_student.id = tbl_record.student_id WHERE name LIKE 'W%' OR name LIKE 'X%' OR name LIKE 'Y%' OR name LIKE 'Z%' "
					+"  AND tbl_student.isdeleted='0' "
					+"	GROUP BY tbl_student.id,tbl_student.number, tbl_student.name "
					+"  ORDER BY tbl_student.name ", new RowMapper<Student>(){
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
		
		else {
			return template.query("", new RowMapper<Student>(){
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
	}
	
}
