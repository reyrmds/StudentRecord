INSERT INTO tbl_gradesheet(section,semester,sy,subject_id,faculty_id)
SELECT DISTINCT section,semester,sy,subject_id,faculty_id
from tbl_record where gradesheet_id is null

UPDATE tbl_record set tbl_record.gradesheet_id=
tbl_gradesheet.id from tbl_record inner join
tbl_gradesheet on tbl_record.section=tbl_gradesheet.section AND
tbl_record.semester=tbl_gradesheet.semester AND 
tbl_record.sy=tbl_gradesheet.sy AND
tbl_record.subject_id=tbl_gradesheet.subject_id 

WHERE tbl_record.section=tbl_gradesheet.section AND
tbl_record.semester=tbl_gradesheet.semester AND 
tbl_record.sy=tbl_gradesheet.sy AND
tbl_record.subject_id=tbl_gradesheet.subject_id

SELECT DISTINCT SECTION,SEMESTER,SY,SUBJECT_ID,faculty_id,GRADESHEET_ID FROM TBL_RECORD WHERE gradesheet_id is null
SELECT * FROM TBL_RECORD

UPDATE tbl_record SET gradesheet_id='248' 
WHERE SECTION='BBA 3-1' AND 
semester IS NULL AND 
SY='2008-2009' AND 
subject_id='10910' AND
faculty_id IS NULL

SELECT distinct(gradesheet_id) FROM tbl_record
select * from tbl_gradesheet

delete from tbl_gradesheet where section like '%test%'

SELECT * FROM TBL_RECORD WHERE section='TEST SECTION'
INSERT INTO TBL_RECORD VALUES ('TEST SECTION','TEST GRADE','TEST REMARKS','TEST SEM','TEST SY','11974','10875','0',NULL,'TEST FACULTY NAME',
(SELECT ID FROM tbl_gradesheet WHERE section='TEST SECTION' AND semester='TEST SEM' AND SY='TEST SY' or faculty_id=''))

INSERT INTO tbl_gradesheet VALUES ('TEST SECTION','TEST SEM','TEST SY','10875',NULL,'0')
USE SRIS_DB
delete from tbl_record where section like '%TEST%'