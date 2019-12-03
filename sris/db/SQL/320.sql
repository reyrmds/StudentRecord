SELECT distinct tbl_subject.code+CASE WHEN tbl_subject.description != '' THEN (' - '+tbl_subject.description) ELSE '' end, tbl_subject.units, tbl_record.section, tbl_record.semester, tbl_record.sy FROM tbl_record INNER JOIN tbl_subject ON tbl_record.subject_id = tbl_subject.id where tbl_subject.code+tbl_subject.description = 'AC 116'

SELECT tbl_student.number, tbl_student.name, tbl_record.grade, tbl_record.remarks, tbl_subject.code, tbl_subject.description, tbl_subject.units, tbl_record.section, tbl_record.semester, tbl_record.sy
FROM   tbl_record INNER JOIN
             tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN
             tbl_subject ON tbl_record.subject_id = tbl_subject.id
			 WHERE
			 tbl_subject.code='ST 113' AND tbl_record.section='BBA 2-1' AND 
			 tbl_record.semester='2ND' and tbl_record.sy='2007-2008'

			 ORDER BY tbl_student.name