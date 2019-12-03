INSERT INTO tbl_student(code,name) select DISTINCT sris.student_number,sris.student_name from sris
INSERT INTO tbl_subject(code,description,units) select distinct sris.subject_code,'',sris.units from sris
INSERT INTO tbl_record(section,grade,remarks,semester,sy,student_id,subject_id,faculty_id,isdeleted) 
select sris.year_section,sris.final_grade,sris.remarks,sris.semester,sris.sy,sris.STUDENT_ID,sris.SUBJECT_ID,FACULTY_ID,'0'
 FROM sris

select * from tbl_student
select * from tbl_subject
select * from tbl_record

select * from sris


delete from tbl_record
delete from tbl_student
delete from tbl_subject

INSERT INTO tbl_student(name,number) select DISTINCT sris.student_name,sris.student_number from sris
INSERT INTO tbl_subject(code,description,units) select distinct sris.subject_code,'',sris.units from sris

update tbl_student set name='CONCEPCION, MARY JOY F' where number='06-00366-9'
update tbl_student set name='EDIO, HERALDO F' where number='06-00311-9'
update tbl_student set name='ESTIOKO, RACHELLE B.' where number='06-00296-7'
update tbl_student set name='FORCADO, DONNA JAY P.' where number='06-00315-6'
update tbl_student set name='MORALES, NERIZZA F.' where number='05-00233'


select sris.year_section,sris.final_grade,sris.remarks,sris.semester,sris.sy,tbl_student.ID,tbl_SUBJECT.ID
 FROM sris inner join tbl_student on sris.STUDENT_NAME=tbl_student.name inner join tbl_subject on sris.SUBJECT_CODE=tbl_subject.code 

 select tbl_student.id from tbl_student 
 update sris set SRIS.STUDENT_ID=(select tbl_student.id from tbl_student  WHERE SRIS.STUDENT_NAME=tbl_student.name)


 

UPDATE  sris set SUBJECT_ID=tbl_subject.id 
from sris INNER JOIN tbl_subject 
on tbl_subject.code=sris.SUBJECT_CODE


UPDATE  SRIS set STUDENT_ID= tbl_student.id 
from sris INNER JOIN tbl_student 
on tbl_student.NAME=sris.STUDENT_NAME

select distinct subject_code,subject_id from sris

select * from tbl_record

UPDATE tbl_record SET isdeleted='0'

select * from tbl_student where Id='11974'


SELECT  tbl_record.section,(tbl_subject.code+'  '+tbl_subject.description), tbl_subject.units, tbl_record.grade, tbl_record.remarks, tbl_record.semester, tbl_record.sy FROM   tbl_record INNER JOIN tbl_subject ON tbl_record.subject_id = tbl_subject.id  where student_id='11974' and  tbl_record.isdeleted='0' ORDER BY tbl_record.section


select * from tbl_record where student_id='11974'