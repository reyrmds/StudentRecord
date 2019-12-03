SELECT DISTINCT (tbl_job.job_title+' - '+tbl_departments.dept_name),  tbl_competency.competency_name, 
tbl_job_competency.job_competency_competency_level, (tbl_employees.emp_last_name+', '+tbl_employees.emp_first_name),
 COALESCE(tbl_competency_status.competency_status_competency_score,'No Competency') as value,  
CASE WHEN tbl_competency_status.competency_status_competency_score IS NULL THEN 'No Competency' 
WHEN tbl_competency_status.competency_status_competency_score ='Basic' AND job_competency_competency_level!='Intermediate' 
OR job_competency_competency_level!='Advance' OR job_competency_competency_level!='Superior'  THEN 'Needs Improvement' 
WHEN tbl_competency_status.competency_status_competency_score ='Advanced' 
AND job_competency_competency_level='Superior' THEN 'Needs Improvement' 
WHEN tbl_competency_status.competency_status_competency_score ='Intermediate' AND job_competency_competency_level='Basic' 
OR job_competency_competency_level!='Advance' OR job_competency_competency_level!='Superior' THEN  'Needs Improvement' 
ELSE 'Desired level attained' END AS score 

FROM tbl_job 

INNER JOIN tbl_job_competency ON '1' = tbl_job_competency.job_competency_job_id INNER JOIN tbl_employees ON tbl_job.job_id = '1'
LEFT JOIN tbl_competency_status ON tbl_job_competency.job_competency_competency_id = tbl_competency_status.competency_status_competency_id AND tbl_competency_status.competency_status_emp_id='1'
INNER JOIN tbl_competency ON tbl_job_competency.job_competency_competency_id = tbl_competency.competency_id 
INNER JOIN tbl_departments ON tbl_job.job_dept_id = tbl_departments.dept_id where tbl_employees.emp_id='1'
