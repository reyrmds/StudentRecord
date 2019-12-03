SELECT distinct TOP 1 (CASE WHEN tbl_subject.code ='-' THEN 'NC' ELSE tbl_subject.code  
				 END+CASE WHEN tbl_subject.description != '' THEN (' - '+tbl_subject.description) ELSE '' end),  
				 tbl_record.units, tbl_record.section, tbl_record.semester, tbl_record.sy,tbl_subject.code,tbl_record.faculty_id, 
				 tbl_faculty.name,tbl_subject.id, (tbl_subject.code+' '+tbl_subject.description) FROM tbl_record INNER JOIN  
				 tbl_subject ON tbl_record.subject_id = tbl_subject.id INNER JOIN tbl_faculty ON tbl_record.faculty_id = tbl_faculty.id  
				 where tbl_subject.id='11168' AND tbl_subject.isdeleted='0' ORDER BY tbl_record.sy


				SELECT * FROM TBL_SUBJECT WHERE CODE ='-'

				UPDATE TBL_SUBJECT SET CODE='NC' WHERE CODE ='-'