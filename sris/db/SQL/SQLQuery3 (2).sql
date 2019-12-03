INSERT INTO TBL_STUDENT (NUMBER,NAME,ISDELETED)
SELECT DISTINCT STUDENT_NUMBER,STUDENT_NAME,'0' FROM SRIS
INSERT INTO TBL_SUBJECT (CODE,DESCRIPTION,UNITS,ISDELETED)
SELECT DISTINCT SUBJECT_CODE,SUBJECT_DESCRIPTION,UNITS,'0' FROM SRIS
INSERT INTO TBL_FACULTY (NAME,ISDELETED)
SELECT DISTINCT FACULTY_NAME,'0' FROM SRIS


INSERT INTO SRIS (STUDENT_NUMBER, STUDENT_NAME, FINAL_GRADE, 
REMARKS, SUBJECT_CODE, SUBJECT_DESCRIPTION, UNITS, YEAR_SECTION, SEMESTER, SY, FACULTY_NAME)

SELECT DISTINCT * FROM COMPILED

DELETE FROM SRIS



UPDATE SRIS SET FACULTY_NAME='-' WHERE FACULTY_NAME IS NULL
UPDATE SRIS SET STUDENT_NUMBER='19'+STUDENT_NUMBER WHERE STUDENT_NUMBER LIKE '9%'

SELECT DISTINCT STUDENT_NUMBER,STUDENT_NAME,'0' FROM SRIS  WHERE STUDENT_NUMBER
UPDATE SRIS SET STUDENT_NAME=
(SELECT TOP 1 STUDENT_NAME FROM SRIS B WHERE STUDENT_NUMBER = B.STUDENT_NUMBER 
 AND STUDENT_NUMBER IS NOT NULL AND STUDENT_NAME IS NOT NULL )
 FROM SRIS A


UPDATE SRIS SET STUDENT_NUMBER='19'+STUDENT_NUMBER WHERE STUDENT_NUMBER LIKE '9%'

SELECT STUDENT_NUMBER FROM SRIS WHERE STUDENT_NUMBER LIKE '9%'

SELECT DISTINCT SUBJECT_CODE,SUBJECT_DESCRIPTION,UNITS FROM SRIS WHERE SUBJECT_DESCRIPTION IS NOT NULL

UPDATE SRIS SET SUBJECT_DESCRIPTION=
(SELECT TOP 1 SUBJECT_DESCRIPTION FROM SRIS B WHERE A.SUBJECT_CODE = B.SUBJECT_CODE ) FROM SRIS A
WHERE SUBJECT_DESCRIPTION IS NULL

INSERT INTO TBL_SUBJECT 
SELECT DISTINCT SUBJECT_CODE,SUBJECT_DESCRIPTION,'0' FROM SRIS
SELECT 

SELECT * FROM SRIS
WHERE STUDENT_NUMBER LIKE '0%'


INSERT INTO TBL_STUDENT 
SELECT DISTINCT STUDENT_NUMBER,STUDENT_NAME,'0' FROM SRIS

UPDATE SRIS SET SUBJECT_ID =
(SELECT ID,CODE FROM TBL_SUBJECT A WHERE CODE IN(
SELECT DISTINCT  SUBJECT_CODE FROM SRIS WHERE SUBJECT_ID IS NULL))

UPDATE SRIS SET SUBJECT_ID ='11425'
WHERE SUBJECT_ID IS NULL AND 'MANA 4023'=SUBJECT_CODE
UPDATE SRIS SET SUBJECT_ID ='11417'
WHERE SUBJECT_ID IS NULL AND 'LAW 2013'=SUBJECT_CODE
UPDATE SRIS SET SUBJECT_ID ='11298'
WHERE SUBJECT_ID IS NULL AND 'COSC 2033'=SUBJECT_CODE
UPDATE SRIS SET SUBJECT_ID ='11423'
WHERE SUBJECT_ID IS NULL AND 'MANA 3033'=SUBJECT_CODE
UPDATE SRIS SET SUBJECT_ID ='11281'
WHERE SUBJECT_ID IS NULL AND 'ACCO 2033'=SUBJECT_CODE


UPDATE SRIS SET SUBJECT_ID ='11356' WHERE SUBJECT_ID IS NULL AND SUBJECT_CODE = 'ENMA 3103'
UPDATE SRIS SET SUBJECT_ID ='11458'	WHERE SUBJECT_ID IS NULL AND SUBJECT_CODE = 'NASC 1083'
UPDATE SRIS SET SUBJECT_ID ='11478'	WHERE SUBJECT_ID IS NULL AND SUBJECT_CODE = 'PHED 1012'
UPDATE SRIS SET SUBJECT_ID ='11491'	WHERE SUBJECT_ID IS NULL AND SUBJECT_CODE = 'PY 100'
UPDATE SRIS SET SUBJECT_ID ='11401'	WHERE SUBJECT_ID IS NULL AND SUBJECT_CODE = 'FINA 2023'

SELECT * FROM SRIS WHERE FACULTY_ID IS NULL

SELECT DISTINCT FACULTY_NAME FROM SRIS

UPDATE SRIS SET FACULTY_NAME=REPLACE(FACULTY_NAME,'DR. ','')
WHERE FACULTY_NAME LIKE 'DR. %'


SELECT * FROM TBL_RECORD WHERE STUDENT_ID IS NULL OR SUBJECT_ID IS NULL OR FACULTY_ID IS NULL


USE [ERP]
GO
/****** Object:  Trigger [dbo].[COURSE_COMPETENCY_UPDATE]    Script Date: 4/10/2018 5:39:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[COURSE_COMPETENCY_UPDATE] ON [dbo].[TBL_EMPLOYEE_COURSE_ENROLMENT] AFTER INSERT
AS 
DECLARE @PCourse nvarchar(128),@PEnroll nvarchar(128)
SET @PEnroll=(SELECT TOP 1 EMP_C_E_ID FROM TBL_EMPLOYEE_COURSE_ENROLMENT ORDER BY EMP_C_E_ID DESC)
SET @PCourse=(SELECT TOP 1 COURSE_ID FROM TBL_EMPLOYEE_COURSE_ENROLMENT ORDER BY EMP_C_E_ID DESC)
IF ((SELECT TRIGGER_NESTLEVEL()) < 2)
BEGIN
	INSERT INTO TBL_COMPETENCY_STATUS([COMPETENCY_STATUS_EMP_ID],[COMPETENCY_STATUS_COMPETENCY_ID],
	[COMPETENCY_STATUS_COMPETENCY_SCORE]) 
	
	SELECT TBL_EMPLOYEE_COURSE_ENROLMENT.EMP_ID, TBL_COMPETENCY.COMPETENCY_ID, 
	TBL_COURSE_COMPETENCY.COMPETENCY_LEVEL
	FROM   TBL_EMPLOYEE_COURSE_ENROLMENT INNER JOIN
	TBL_COURSE ON TBL_EMPLOYEE_COURSE_ENROLMENT.COURSE_ID = TBL_COURSE.COURSE_ID INNER JOIN
	TBL_COURSE_COMPETENCY ON TBL_COURSE.COURSE_ID = TBL_COURSE_COMPETENCY.COURSE_ID INNER JOIN
	TBL_COMPETENCY ON TBL_COURSE_COMPETENCY.COMPETENCY_ID = TBL_COMPETENCY.COMPETENCY_ID
	WHERE @PEnroll= TBL_EMPLOYEE_COURSE_ENROLMENT.EMP_C_E_ID

END

SELECT TBL_EMPLOYEE_COURSE_ENROLMENT.EMP_ID, TBL_COMPETENCY.COMPETENCY_ID, TBL_COURSE_COMPETENCY.COMPETENCY_LEVEL
FROM   TBL_EMPLOYEE_COURSE_ENROLMENT INNER JOIN
TBL_COURSE ON TBL_EMPLOYEE_COURSE_ENROLMENT.COURSE_ID = TBL_COURSE.COURSE_ID INNER JOIN
TBL_COURSE_COMPETENCY ON TBL_COURSE.COURSE_ID = TBL_COURSE_COMPETENCY.COURSE_ID INNER JOIN
TBL_COMPETENCY ON TBL_COURSE_COMPETENCY.COMPETENCY_ID = TBL_COMPETENCY.COMPETENCY_ID