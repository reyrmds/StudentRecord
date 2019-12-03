SELECT DISTINCT tbl_job.job_name as title
, tbl_department.dept_name as department,
 tbl_competency.competency_name as competency, 
tbl_job_competency.job_competency_competency_level as level, 
tbl_employee.emp_last_name as lname,tbl_employee.emp_first_name as fname,
COALESCE(tbl_competency_status.competency_status_competency_score,
	'No Competency'
) as value,  
CASE WHEN tbl_competency_status.competency_status_competency_score 
IS NULL THEN 'No Competency' 
WHEN tbl_competency_status.competency_status_competency_score ='Basic'
 AND job_competency_competency_level!='Basic' THEN 'Needs Improvement' 
 WHEN tbl_competency_status.competency_status_competency_score ='Advanced' 
 AND job_competency_competency_level='Superior' THEN 'Needs Improvement' 
 WHEN tbl_competency_status.competency_status_competency_score ='Intermediate' 
 AND job_competency_competency_level!='Basic'  
 AND job_competency_competency_level!='Intermdiate' THEN
   'Needs Improvement' ELSE 'Desired level attained'
    END AS score FROM tbl_job INNER JOIN tbl_job_competency
     ON tbl_job.job_id = tbl_job_competency.job_competency_job_id
	 INNER JOIN REF_EMP_JOB ON TBL_JOB.JOB_ID =  REF_EMP_JOB.JOB_ID
INNER JOIN TBL_EMPLOYEE ON REF_EMP_JOB.EMP_ID = TBL_EMPLOYEE.EMP_ID
	  LEFT JOIN tbl_competency_status ON tbl_job_competency.job_competency_competency_id = tbl_competency_status.competency_status_competency_id  
	  inner JOIN tbl_competency ON tbl_job_competency.job_competency_competency_id = tbl_competency.competency_id 
	  INNER JOIN tbl_department ON tbl_job.dept_id = tbl_department.dept_id