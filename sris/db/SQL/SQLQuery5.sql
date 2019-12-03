SELECT tbl_subject.code, tbl_subject.description, CASE WHEN tbl_record.grade IS NULL THEN 'INC' 
ELSE tbl_record.grade END as grade, CASE WHEN tbl_record.grade IS NULL THEN '0' 
ELSE tbl_subject.units END as units,
(SELECT DISTINCT (SY+', '+CASE WHEN semester='1ST' THEN 'FIRST SEMESTER' ELSE 'SECOND SEMESTER' END) as sysem
FROM   tbl_record INNER JOIN
tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN
tbl_subject ON tbl_record.subject_id = tbl_subject.id

where tbl_student.id=12135
) 
FROM   tbl_record INNER JOIN
             tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN
             tbl_subject ON tbl_record.subject_id = tbl_subject.id

			 where tbl_student.id=12135
			 
