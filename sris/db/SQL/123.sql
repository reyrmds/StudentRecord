SELECT tbl_subject.code, tbl_subject.description, CASE WHEN tbl_record.grade IS NULL THEN 'INC' ELSE tbl_record.grade END, CASE WHEN tbl_record.grade IS NULL THEN '0' ELSE tbl_subject.units END,SY+', '+CASE WHEN semester='1ST' THEN 'FIRST SEMESTER' ELSE 'SECOND SEMESTER' END 
FROM   tbl_record INNER JOIN
             tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN
             tbl_subject ON tbl_record.subject_id = tbl_subject.id

			 where tbl_student.id=12135

			 ORDER BY (SY+' '+SEMESTER)

			 select distinct SY+', '+CASE WHEN semester='1ST' THEN 'FIRST SEMESTER' ELSE 'SECOND SEMESTER' END 
			 from tbl_record INNER JOIN
             tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN
             tbl_subject ON tbl_record.subject_id = tbl_subject.id