package sris.model;

public class Student {
	
	int section_id,semester_id, sy_id,course_id,ref_id,curriculum_id,user_id,student_id,subject_id,record_id,faculty_id,facultysubject_id;
	int gsection_id,gsemester_id,gsy_id,gcourse_id,gfacultysubject_id;
	String student_name,student_number,subject_code,subject_desc,subject_units;
	String record_section,record_grade,record_remarks,record_semester,record_sy,record_total;
	String faculty_name,faculty_last,faculty_first,faculty_middle;
	String user_full,user_email,user_name,user_pass,user_role,user_units;
	String curriculum_sy;
	String curriculum_subject_units;
	String course_code,course_course;
	String sy_sy;
	String semester_semester;
	String section_section;
	
	public Student() {
		
	}

	public Student(int gsection_id,int gsemester_id,int gsy_id,int gcourse_id,int gfacultysubject_id,String section_section,int section_id,String semester_semester,int semester_id,String sy_sy,int sy_id,int course_id,String course_code,String course_course,String curriculum_subject_units,int ref_id,int curriculum_id,String curriculum_sy,String record_total,String user_units,int user_id,String user_full,String user_email,String user_name,String user_pass,String user_role,int facultysubject_id,String faculty_name,int faculty_id,String faculty_last,String faculty_first,String faculty_middle,String record_section,String record_grade,String record_remarks,String record_semester,String record_sy,String subject_code,String subject_desc,String subject_units,int subject_id,int record_id,String student_name,String student_number,int student_id) {
		this.gsection_id=gsection_id;
		this.gsemester_id=gsemester_id;
		this.gsy_id=gsy_id;
		this.gcourse_id=gcourse_id;
		this.gfacultysubject_id=gfacultysubject_id;
		this.section_section=section_section;
		this.section_id=section_id;
		this.semester_semester=semester_semester;
		this.semester_id=semester_id;
		this.sy_sy=sy_sy;
		this.sy_id=sy_id;
		this.course_id=course_id;
		this.course_code=course_code;
		this.course_course=course_course;
		this.curriculum_subject_units=curriculum_subject_units;
		this.ref_id=ref_id;
		this.curriculum_id=curriculum_id;
		this.curriculum_sy=curriculum_sy;
		this.record_total=record_total;
		this.user_units=user_units;
		this.user_id=user_id;
		this.user_full=user_full;
		this.user_email=user_email;
		this.user_name=user_name;
		this.user_pass=user_pass;
		this.user_role=user_role;
		this.facultysubject_id=facultysubject_id;
		this.faculty_name=faculty_name;
		this.faculty_id=faculty_id;
		this.faculty_first=faculty_first;
		this.faculty_last=faculty_last;
		this.faculty_middle=faculty_middle;
		this.subject_id=subject_id;
		this.record_id=record_id;
		this.student_id=student_id;
		this.student_name=student_name;
		this.student_number=student_number;
		this.subject_code=subject_code;
		this.subject_desc=subject_desc;
		this.subject_units=subject_units;
		this.record_section=record_section;
		this.record_grade=record_grade;
		this.record_remarks=record_remarks;
		this.record_semester=record_semester;
		this.record_sy=record_sy;

	}
	public int getGfacultysubject_id() {
		return gfacultysubject_id;
	}

	public void setGfacultysubject_id(int gfacultysubject_id) {
		this.gfacultysubject_id = gfacultysubject_id;
	}
	public int getGsection_id() {
		return gsection_id;
	}

	public void setGsection_id(int gsection_id) {
		this.gsection_id = gsection_id;
	}
	
	public int getGsemester_id() {
		return gsemester_id;
	}

	public void setGsemester_id(int gsemester_id) {
		this.gsemester_id = gsemester_id;
	}
	
	public int getGsy_id() {
		return gsy_id;
	}

	public void setGsy_id(int gsy_id) {
		this.gsy_id = gsy_id;
	}
	
	public int getGcourse_id() {
		return gcourse_id;
	}

	public void setGcourse_id(int gcourse_id) {
		this.gcourse_id = gcourse_id;
	}
	
	public int getSection_id() {
		return section_id;
	}

	public void setSection_id(int section_id) {
		this.section_id = section_id;
	}
	
	public int getSemester_id() {
		return semester_id;
	}

	public void setSemester_id(int semester_id) {
		this.semester_id = semester_id;
	}
	
	public int getSy_id() {
		return sy_id;
	}

	public void setSy_id(int sy_id) {
		this.sy_id = sy_id;
	}
	
	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	
	public int getRef_id() {
		return ref_id;
	}

	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}
	
	public int getCurriculum_id() {
		return curriculum_id;
	}

	public void setCurriculum_id(int curriculum_id) {
		this.curriculum_id = curriculum_id;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getFacultysubject_id() {
		return facultysubject_id;
	}

	public void setFacultysubject_id(int facultysubject_id) {
		this.facultysubject_id = facultysubject_id;
	}
	public int getFaculty_id() {
		return faculty_id;
	}

	public void setFaculty_id(int faculty_id) {
		this.faculty_id = faculty_id;
	}
	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	
	public String getUser_units() {
		return user_units;
	}

	public void setUser_units(String user_units) {
		this.user_units = user_units;
	}
	
	public String getRecord_total() {
		return record_total;
	}

	public void setRecord_total(String record_total) {
		this.record_total = record_total;
	}
	public String getFaculty_name() {
		return faculty_name;
	}

	public void setFaculty_name(String faculty_name) {
		this.faculty_name = faculty_name;
	}
	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_number() {
		return student_number;
	}

	public void setStudent_number(String student_number) {
		this.student_number = student_number;
	}

	public int getSubject_id() {
		return subject_id;
	}

	public int getRecord_id() {
		return record_id;
	}

	public String getSubject_code() {
		return subject_code;
	}

	public String getSubject_desc() {
		return subject_desc;
	}

	public String getSubject_units() {
		return subject_units;
	}

	public String getRecord_section() {
		return record_section;
	}

	public String getRecord_grade() {
		return record_grade;
	}

	public String getRecord_remarks() {
		return record_remarks;
	}

	public String getRecord_semester() {
		return record_semester;
	}

	public String getRecord_sy() {
		return record_sy;
	}
	
	public String getFaculty_last() {
		return faculty_last;
	}
	public String getFaculty_first() {
		return faculty_first;
	}
	public String getFaculty_middle() {
		return faculty_middle;
	}
	
	public void setFaculty_last(String faculty_last) {
		this.faculty_last = faculty_last;
	}
	public void setFaculty_first(String faculty_first) {
		this.faculty_first = faculty_first;
	}
	public void setFaculty_middle(String faculty_middle) {
		this.faculty_middle = faculty_middle;
	}
	
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}

	public void setSubject_code(String subject_code) {
		this.subject_code = subject_code;
	}

	public void setSubject_desc(String subject_desc) {
		this.subject_desc = subject_desc;
	}

	public void setSubject_units(String subject_units) {
		this.subject_units = subject_units;
	}

	public void setRecord_section(String record_section) {
		this.record_section = record_section;
	}

	public void setRecord_grade(String record_grade) {
		this.record_grade = record_grade;
	}

	public void setRecord_remarks(String record_remarks) {
		this.record_remarks = record_remarks;
	}

	public void setRecord_semester(String record_semester) {
		this.record_semester = record_semester;
	}

	public void setRecord_sy(String record_sy) {
		this.record_sy = record_sy;
	}

	
	public String getUser_full() {
		return user_full;
	}
	
	public void setUser_full(String user_full) {
		this.user_full = user_full;
	}
	public String getUser_email() {
		return user_email;
	}
	
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	
	public String getUser_role() {
		return user_role;
	}
	
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	
	public String getCurriculum_sy() {
		return curriculum_sy;
	}
	
	public void setCurriculum_sy(String curriculum_sy) {
		this.curriculum_sy = curriculum_sy;
	}
	
	
	public String getCurriculum_subject_units() {
		return curriculum_subject_units;
	}
	
	public void setCurriculum_subject_units(String curriculum_subject_units) {
		this.curriculum_subject_units = curriculum_subject_units;
	}
	
	public String getCourse_code() {
		return course_code;
	}
	
	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	
	public String getCourse_course() {
		return course_course;
	}
	
	public void setCourse_course(String course_course) {
		this.course_course = course_course;
	}
	
	public String getSy_sy() {
		return sy_sy;
	}
	
	public void setSy_sy(String sy_sy) {
		this.sy_sy = sy_sy;
	}
	public String getSemester_semester() {
		return semester_semester;
	}
	
	public void setSemester_semester(String semester_semester) {
		this.semester_semester = semester_semester;
	}
	
	public String getSection_section() {
		return section_section;
	}
	
	public void setSection_section(String section_section) {
		this.section_section = section_section;
	}
	
	
	
}
