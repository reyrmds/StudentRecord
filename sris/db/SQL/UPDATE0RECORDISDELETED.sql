
UPDATE TBL_STUDENT SET ISDELETED='1' WHERE ID IN (
SELECT ID FROM TBL_STUDENT WHERE NOT EXISTS (SELECT STUDENT_ID FROM SRIS WHERE
NAME=STUDENT_NAME AND NUMBER=STUDENT_NUMBER)
)

UPDATE TBL_FACULTY SET ISDELETED='1' WHERE ID IN (
SELECT ID FROM TBL_FACULTY WHERE NOT EXISTS (SELECT FACULTY_ID FROM SRIS WHERE
NAME=FACULTY_NAME )
)

UPDATE TBL_SUBJECT SET ISDELETED='1' WHERE ID IN (
SELECT ID FROM TBL_SUBJECT WHERE NOT EXISTS (SELECT SUBJECT_ID FROM SRIS WHERE
CODE=SUBJECT_CODE AND DESCRIPTION=SUBJECT_DESCRIPTION)
)


