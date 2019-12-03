CREATE TABLE tbl_student
(
student_id INT IDENTITY(1,1) PRIMARY KEY,
student_code NVARCHAR(50),
student_name NVARCHAR(100)
)

CREATE TABLE tbl_subject
(
subject_id INT IDENTITY(1,1) PRIMARY KEY,
subject_code NVARCHAR(50),
subject_description NVARCHAR(50),
subject_units NVARCHAR(10),
)

CREATE TABLE tbl_record
(
id INT IDENTITY(1,1) PRIMARY KEY,
section NVARCHAR(50),
grade  NVARCHAR(50),
remarks NVARCHAR(50),
semester NVARCHAR(50),
sy NVARCHAR(50),
student_id INT FOREIGN KEY REFERENCES tbl_student(id),
subject_id INT FOREIGN KEY REFERENCES tbl_subject(id)
)