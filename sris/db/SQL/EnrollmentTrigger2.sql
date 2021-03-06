USE [ERP]
GO
/****** Object:  Trigger [dbo].[COURSE_COMPETENCY_UPDATE]    Script Date: 4/11/2018 8:57:57 AM ******/
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
	WHERE @PEnroll= TBL_EMPLOYEE_COURSE_ENROLMENT.EMP_C_E_ID AND NOT EXISTS 
	(SELECT [COMPETENCY_STATUS_EMP_ID],[COMPETENCY_STATUS_COMPETENCY_ID],
	[COMPETENCY_STATUS_COMPETENCY_SCORE] FROM TBL_COMPETENCY_STATUS)

END
delete from TBL_COMPETENCY_STATUS
select * from TBL_COMPETENCY_STATUS