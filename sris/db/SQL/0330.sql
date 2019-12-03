SELECT tbl_record.subject_id,tbl_record.section, tbl_record.semester, tbl_record.sy,
		tbl_record.faculty_id FROM tbl_record 
			INNER JOIN tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN tbl_subject ON tbl_record.subject_id =
			 tbl_subject.id LEFT JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id

			 SELECT TOP 1 tbl_subject.id,tbl_record.section, tbl_record.semester, tbl_record.sy
			 FROM tbl_record 
			 INNER JOIN tbl_subject ON tbl_record.subject_id = 
			tbl_subject.id WHERE 
			tbl_subject.code= 'ST 113'  AND tbl_record.section= 'BBA 2-1' AND 
			 tbl_record.semester= '2ND'  AND tbl_record.sy='2007-2008' 

			 select * from tbl_subject where id='10875'

			 SELECT TOP 1 tbl_record.subject_id,tbl_record.section, tbl_record.semester, tbl_record.sy,
			 tbl_record.faculty_id FROM tbl_record 
			 INNER JOIN tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN tbl_subject ON tbl_record.subject_id = 
				tbl_subject.id LEFT JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id WHERE tbl_subject.code= 'ST 113' 
				AND tbl_record.section='BBA 2-1'AND  tbl_record.semester= '2ND'  AND tbl_record.sy='2007-2008' 
				
				SELECT TOP 1 tbl_record.subject_id,tbl_record.section, tbl_record.semester, tbl_record.sy,
				 tbl_record.faculty_id FROM tbl_record 
				INNER JOIN tbl_subject ON tbl_record.subject_id = 
				 tbl_subject.id LEFT JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id WHERE tbl_subject.code= 'AC 113' 
						AND tbl_record.section= 'testsection2' AND  tbl_record.semester= '1ST'   AND tbl_record.sy='1993-1994'
						
						
						SELECT DISTINCT TOP 1 tbl_student.number, tbl_student.name, CASE WHEN tbl_record.grade IS NULL THEN '' ELSE tbl_record.grade END,
		 tbl_record.remarks,tbl_record.subject_id,tbl_record.section, tbl_record.semester, tbl_record.sy,
			 tbl_record.faculty_id,(+'('+tbl_subject.code+') '+tbl_subject.description),tbl_subject.units FROM tbl_record
			 INNER JOIN tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN tbl_subject ON tbl_record.subject_id =
			 tbl_subject.id LEFT JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id 

			 SELECT tbl_student.number, tbl_student.name, CASE WHEN tbl_record.grade IS NULL THEN '' ELSE tbl_record.grade END, tbl_record.remarks,tbl_record.subject_id, tbl_subject.code as code, tbl_subject.description as description, tbl_subject.units, tbl_record.section, tbl_record.semester, tbl_record.sy, CASE WHEN tbl_faculty.name IS NULL THEN '' ELSE tbl_faculty.name END as faculty FROM tbl_record INNER JOIN tbl_student ON tbl_record.student_id = tbl_student.id INNER JOIN tbl_subject ON tbl_record.subject_id = tbl_subject.id LEFT JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id 
