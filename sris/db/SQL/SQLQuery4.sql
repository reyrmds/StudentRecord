SELECT DISTINCT (SY+', '+CASE WHEN semester='1ST' THEN 'FIRST SEMESTER' ELSE 'SECOND SEMESTER' END) as sysem
FROM   tbl_record INNER JOIN
tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN
tbl_subject ON tbl_record.subject_id = tbl_subject.id

where tbl_student.id=12135

ORDER BY SY+', '+CASE WHEN semester='1ST' THEN 'FIRST SEMESTER' ELSE 'SECOND SEMESTER' END 