SELECT DISTINCT tbl_student.number, tbl_student.name, 
(COUNT(tbl_record.id))
FROM   tbl_student JOIN
tbl_record ON tbl_student.id = tbl_record.student_id
GROUP BY tbl_student.number, tbl_student.name


INSERT INTO TBL_SUBJECT

UPDATE TBL_SUBJECT SET ISDELETED='1' WHERE ID IN 
(SELECT ID FROM TBL_SUBJECT
WHERE NOT EXISTS (SELECT DISTINCT SUBJECT_CODE,SUBJECT_DESCRIPTION FROM SRIS WHERE
SUBJECT_CODE=CODE AND description=SUBJECT_DESCRIPTION))

UPDATE tbl_faculty SET ISDELETED='1' WHERE ID IN 
(SELECT ID FROM tbl_faculty
WHERE NOT EXISTS (SELECT DISTINCT FACULTY_NAME FROM SRIS WHERE
FACULTY_NAME=NAME))


UPDATE SRIS SET SUBJECT_CODE=
(SELECT TOP 1 SUBJECT_CODE FROM SRIS B WHERE A.SUBJECT_DESCRIPTION=B.SUBJECT_DESCRIPTION) FROM SRIS A

UPDATE SRIS SET FACULTY_NAME=REPLACE(FACULTY_NAME,'MS. ','')
WHERE FACULTY_NAME LIKE 'MS. %'

SELECT * FROM SRIS
WHERE FACULTY_NAME LIKE 'PROF. %' OR  'DR. %' , 'MS. %' 

SELECT NAME FROM tbl_faculty
WHERE NOT EXISTS (SELECT DISTINCT FACULTY_NAME FROM SRIS WHERE
NAME=FACULTY_NAME)

INSERT INTO tbl_faculty
SELECT DISTINCT FACULTY_NAME,'0' FROM SRIS
WHERE NOT EXISTS (SELECT NAME FROM tbl_faculty WHERE
NAME=FACULTY_NAME) AND FACULTY_NAME IS NOT NULL
ORDER BY FACULTY_NAME 

UPDATE SRIS SET FACULTY_ID=ID FROM SRIS
INNER JOIN TBL_FACULTY ON NAME=FACULTY_NAME
WHERE NAME=FACULTY_NAME

SELECT * FROM SRIS WHERE FACULTY_ID IS NULL
UPDATE SRIS SET STUDENT_ID='1085' WHERE STUDENT_ID IS NULL 
AND STUDENT_NAME IS NULL AND STUDENT_NUMBER IS NULL


SELECT * FROM SRIS WHERE STUDENT_ID='1085'
