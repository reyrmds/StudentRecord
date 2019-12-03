USE sris_db

UPDATE  sris set SUBJECT_ID=tbl_subject.id 
from sris INNER JOIN tbl_subject 
on tbl_subject.description=sris.SUBJECT_DESCRIPTION 
AND tbl_subject.code=SUBJECT_CODE
WHERE tbl_subject.description=sris.SUBJECT_DESCRIPTION 
AND tbl_subject.code=SUBJECT_CODE

UPDATE  sris set STUDENT_ID=tbl_student.id, 
student_number=tbl_student.number
from sris INNER JOIN tbl_student 
on tbl_student.NAME=sris.STUDENT_NAME AND 
tbl_student.number=sris.STUDENT_NUMBER
WHERE tbl_student.NAME=sris.STUDENT_NAME AND 
tbl_student.number=sris.STUDENT_NUMBER

update sris set sris.FACULTY_ID=tbl_faculty.id from sris inner join tbl_faculty
on tbl_faculty.name=sris.FACULTY_NAME where sris.FACULTY_NAME=tbl_faculty.name

INSERT INTO TBL_STUDENT SELECT DISTINCT STUDENT_NUMBER,STUDENT_NAME,'0' FROM SRIS ORDER BY STUDENT_NAME
UPDATE  sris set STUDENT_ID=tbl_student.id, 
student_number=tbl_student.number
from sris INNER JOIN tbl_student 
on tbl_student.NAME=sris.STUDENT_NAME AND 
tbl_student.number=sris.STUDENT_NUMBER
WHERE tbl_student.NAME=sris.STUDENT_NAME AND 
tbl_student.number=sris.STUDENT_NUMBER

select distinct subject_code,subject_id from sris

select * from tbl_student

SELECT distinct tbl_subject.code FROM tbl_subject inner JOIN SRIS ON tbl_subject.code=SRIS.SUBJECT_CODE 
where tbl_subject.code=SRIS.SUBJECT_CODE 

update tbl_subject  set tbl_subject.description=sris.SUBJECT_DESCRIPTION FROM tbl_subject
inner JOIN SRIS ON tbl_subject.code=SRIS.SUBJECT_CODE 
where tbl_subject.code=SRIS.SUBJECT_CODE 

SELECT DISTINCT FACULTY_NAME FROM SRIS

update sris set sris.FACULTY_ID=tbl_faculty.id from sris inner join tbl_faculty
on tbl_faculty.name=sris.FACULTY_NAME where sris.FACULTY_NAME=tbl_faculty.name

select * from sris

select DISTINCT SRIS.STUDENT_NUMBER,SRIS.STUDENT_NAME FROM SRIS ORDER BY STUDENT_NAME 

SELECT * FROM SRIS WHERE STUDENT_NUMBER='2008-00270-6'

UPDATE SRIS SET STUDENT_NAME='VERONA, LEVY JARITO' WHERE STUDENT_NUMBER='2008-00270-6'
UPDATE SRIS SET student_number='NO STUDENT NUMBER' WHERE STUDENT_NUMBER='NO REG.'

INSERT INTO TBL_STUDENT(number,name,isdeleted)
SELECT DISTINCT student_number,student_name,'0' from sris