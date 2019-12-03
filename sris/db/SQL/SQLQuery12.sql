SELECT DISTINCT tbl_job.job_title as title,tbl_departments.dept_name as department, 
tbl_competency.competency_name as competency, tbl_job_competency.job_competency_competency_level as level,
 tbl_employee.emp_last_name as lname, tbl_employee.emp_first_name as fname, 
 COALESCE(tbl_competency_status.competency_status_competency_score,'No Competency') as value,  
 CASE WHEN tbl_competency_status.competency_status_competency_score IS NULL THEN 'No Competency' 
 WHEN tbl_competency_status.competency_status_competency_score ='Basic' AND job_competency_competency_level='Intermediate' 
 OR job_competency_competency_level='Advanced' OR job_competency_competency_level='Superior' THEN 'Needs Improvement' 
 WHEN tbl_competency_status.competency_status_competency_score ='Advanced' AND job_competency_competency_level='Superior' 
 THEN 'Needs Improvement' WHEN tbl_competency_status.competency_status_competency_score ='Intermediate' 
 AND job_competency_competency_level='Advanced'  OR job_competency_competency_level='Superior' THEN  'Needs Improvement' 
 ELSE 'Desired level attained' END AS score 
 FROM tbl_job 
 INNER JOIN tbl_job_competency ON $P{jobid} = tbl_job_competency.job_competency_job_id 

 INNER JOIN REF_EMP_JOB ON $P{jobid} =  REF_EMP_JOB.JOB_ID
 INNER JOIN TBL_EMPLOYEE ON REF_EMP_JOB.EMP_ID = TBL_EMPLOYEE.EMP_ID  
 LEFT JOIN tbl_competency_status ON tbl_job_competency.job_competency_competency_id = 
 tbl_competency_status.competency_status_competency_id and tbl_competency_status.competency_status_emp_id=$P{employeeid}  
 INNER JOIN tbl_competency 
 ON tbl_job_competency.job_competency_competency_id = tbl_competency.competency_id 
 INNER JOIN tbl_departments ON tbl_job.job_dept_id = tbl_departments.dept_id 
 where tbl_employee.emp_id=$P{employeeid}