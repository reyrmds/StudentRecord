package sris.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import sris.model.Student;
import sris.dao.CurriculumDao;
import sris.dao.FacultyDao;
import sris.dao.FacultySubjectDao;
import sris.dao.GradesheetDao;
import sris.dao.SectionDao;
import sris.dao.SemesterDao;
import sris.dao.StudentDao;
import sris.dao.StudentGradesDao;
import sris.dao.SubjectsDao;
import sris.dao.SyDao;
import sris.dao.UserDao;
import sris.dao.CourseDao;

@SessionAttributes("user")
@Scope("session")
@Controller
public class SRISController {
	
	@Autowired
	StudentDao studentDao;
	@Autowired
	SubjectsDao subjectsDao;
	@Autowired
	GradesheetDao gradesheetDao;
	@Autowired
	FacultyDao facultyDao;
	@Autowired
	StudentGradesDao studentgradesDao;
	@Autowired
	FacultySubjectDao facultysubjectDao;
	@Autowired
	UserDao userDao;
	@Autowired
	CurriculumDao curriculumDao;
	@Autowired
	CourseDao courseDao;
	@Autowired
	SyDao syDao;
	@Autowired
	SemesterDao semesterDao;
	@Autowired
	SectionDao sectionDao;
	
	@RequestMapping(value="/subject_curriculum_setup")
	public ModelAndView getsc_curr() {

		List<Student> getfacultysubject = studentgradesDao.getfacultysubject();
		List<Student> getcourse = studentgradesDao.getcourse();
		List<Student> getsection = studentgradesDao.getsection();
		List<Student> getsemester = studentgradesDao.getsemester();
		List<Student> getsy = studentgradesDao.getsy();
		List<Student> getcurriculumsubjects = studentgradesDao.getcurriculumsubjects();
		List<Student> getcurriculum = studentgradesDao.getcurriculum();
		ModelAndView mav = new ModelAndView("system-setup/subject_curriculum");
		mav.addObject("getcurriculumsubjects",getcurriculumsubjects);
		mav.addObject("getcurriculum",getcurriculum);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/","/login"})
	public ModelAndView log() {
		ModelAndView mav = new ModelAndView("login/login");
		return mav;
	}
	@RequestMapping(value= {"/index_login"})
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index/index_login");
		return mav;
	}
	
	@RequestMapping(value= {"/index"})
	public ModelAndView home(@ModelAttribute("student") Student student,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView("index/index");
		return mav;
	}
	@RequestMapping(value= {"/user"})
	public ModelAndView user_home(@ModelAttribute("student") Student student,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView("user/index");	
		return mav;
	}
	
		
	@RequestMapping(value= {"/user/generate_student_tor"})
	public ModelAndView r_user_student_tor() {	
		List<Student> getStudent = studentDao.getStudent2();
		ModelAndView mav = new ModelAndView("user/generate_student_tor");
		mav.addObject("studentlist","");
		mav.addObject("getStudent",getStudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	

	@RequestMapping(value= {"/subject_setup"})
	public ModelAndView ss_subject() {
		List<Student> subjectlist = subjectsDao.getSubject();
		ModelAndView mav = new ModelAndView("system-setup/subject_setup");
		mav.addObject("subjectlist",subjectlist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/user_management"})
	public ModelAndView ss_user() {
		List<Student> userlist = userDao.getUsers();
		ModelAndView mav = new ModelAndView("system-setup/user_management");
		mav.addObject("userlist",userlist);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/generate_gradesheet"})
	public ModelAndView r_gradesheet() {
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("reports/generate_gradesheet");
		mav.addObject("getrecord","");
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
		
	@RequestMapping(value= {"/user/generate_gradesheet"})
	public ModelAndView r_user_gradesheet() {
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("user/generate_gradesheet");

		mav.addObject("getrecord","");
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/generate_student_tor"})
	public ModelAndView r_student_tor() {	
		List<Student> getStudent = studentDao.getStudent2();
		ModelAndView mav = new ModelAndView("reports/generate_student_tor");
		mav.addObject("studentlist","");
		mav.addObject("getStudent",getStudent);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/faculty_setup"})
	public ModelAndView ss_faculty() {
		List<Student> facultylist = facultyDao.getFaculty();
		ModelAndView mav = new ModelAndView("system-setup/faculty_setup");
		mav.addObject("facultylist",facultylist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/faculty_util"})
	public ModelAndView util_faculty() {
		List<Student> facultylist = facultyDao.getDeletedFaculty();
		ModelAndView mav = new ModelAndView("utilities/faculty_util");
		mav.addObject("facultylist",facultylist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/student_record_util"})
	public ModelAndView util_sr() {
		List<Student> studentlist = studentDao.getDeletedStudent();
		ModelAndView mav = new ModelAndView("utilities/student_record_util");
		mav.addObject("studentlist",studentlist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/student_record_update"})
	public ModelAndView update_sr() {
		
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav = new ModelAndView("update/student_record_update");
		mav.addObject("studentlist","");
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/user/student_record_setup"})
	public ModelAndView user_srcaa() {		
		ModelAndView mav = new ModelAndView("user/student_record_setup");
		mav.addObject("studentlist","");
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/student_record_setup"})
	public ModelAndView ss_record(@ModelAttribute("student") Student student,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView("system-setup/student_record_setup");
		mav.addObject("studentlist","");
		mav.addObject("student", new Student());
		return mav;
	}
	
	
	@RequestMapping(value= {"/subject_record_update"})
	public ModelAndView update_ss_subject() {
		List<Student> subjectlist = subjectsDao.getSubjectUpdate();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();	
		ModelAndView mav = new ModelAndView("update/subject_record_update");
		mav.addObject("subjectlist",subjectlist);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/faculty_record_update"})
	public ModelAndView update_ss_faculty() {
		List<Student> facultylist = facultyDao.getFacultyUpdate();
		List<Student> getfaculty = facultyDao.getFaculty();
		ModelAndView mav = new ModelAndView("update/faculty_record_update");
		mav.addObject("facultylist",facultylist);
		mav.addObject("getfaculty",getfaculty);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/subject_util"})
	public ModelAndView util_subject() {
		List<Student> subjectlist = subjectsDao.getDeletedSubject();
		ModelAndView mav = new ModelAndView("utilities/subject_util");
		mav.addObject("subjectlist",subjectlist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/student_grades_util"})
	public ModelAndView util_student_grade() {
		List<Student> gradeslist = studentDao.getDeletedGrades();
		ModelAndView mav = new ModelAndView("utilities/student_grades_util");
		mav.addObject("gradeslist",gradeslist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value="student_grades_util/restore/{recordid}",method = RequestMethod.GET)
	public ModelAndView restore(@PathVariable int recordid) {
		studentgradesDao.restore(recordid);
		return new ModelAndView("redirect:/student_grades_util");
	}
	@RequestMapping(value="student_grades_util/restoreall")
	public ModelAndView restoreall() {
		studentgradesDao.restoreall();
		return new ModelAndView("redirect:/student_grades_util");
	}
	
	@RequestMapping(value= {"/faculty_subject_setup"})
	public ModelAndView ss_faculty_subject() {
		List<Student> facultysubjectlist = facultysubjectDao.getFacultySubject();
		List<Student> getsubject = subjectsDao.getSubject();
		List<Student> getfaculty = facultyDao.getFaculty();
		ModelAndView mav = new ModelAndView("system-setup/faculty_subject_setup");
		mav.addObject("facultysubjectlist",facultysubjectlist);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfaculty",getfaculty);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/faculty_subject"})
	public ModelAndView s_faculty_subject() {
		List<Student> facultysubjectrecord = facultysubjectDao.getFacultySubjectRecord();
		ModelAndView mav = new ModelAndView("system-setup/faculty_subject");
		mav.addObject("facultysubjectrecord",facultysubjectrecord);
		mav.addObject("student", new Student());
		return mav;
	}
	
	
	
	@RequestMapping(value= {"/faculty_subject_util"})
	public ModelAndView util_faculty_subject() {
		List<Student> facultysubjectlist = facultysubjectDao.getDeletedFacultySubject();
		ModelAndView mav = new ModelAndView("utilities/faculty_subject_util");
		mav.addObject("facultysubjectlist",facultysubjectlist);
		mav.addObject("student", new Student());
		return mav;
	}
	

	@RequestMapping(value= {"/user_util"})
	public ModelAndView util_user() {
		List<Student> userlist = userDao.getDeletedUsers();
		ModelAndView mav = new ModelAndView("utilities/user_util");
		mav.addObject("userlist",userlist);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value= {"/curriculum_setup"})
	public ModelAndView ss_curriculum() {
		List<Student> curriculumlist = curriculumDao.getCurriculum();
		ModelAndView mav = new ModelAndView("system-setup/curriculum_setup");
		mav.addObject("curriculumlist",curriculumlist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/course_setup"})
	public ModelAndView ss_course() {
		List<Student> courselist = courseDao.getCourse();
		ModelAndView mav = new ModelAndView("system-setup/course_setup");
		mav.addObject("courselist",courselist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/sy_setup"})
	public ModelAndView ss_sy() {
		List<Student> sylist = syDao.getsy();
		ModelAndView mav = new ModelAndView("system-setup/sy_setup");
		mav.addObject("sylist",sylist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/semester_setup"})
	public ModelAndView ss_sem() {
		List<Student> semesterlist = semesterDao.getsemester();
		ModelAndView mav = new ModelAndView("system-setup/semester_setup");
		mav.addObject("semesterlist",semesterlist);
		mav.addObject("student", new Student());
		return mav;
	}
	@RequestMapping(value= {"/section_setup"})
	public ModelAndView ss_section() {
		List<Student> sectionlist = sectionDao.getsection();
		ModelAndView mav = new ModelAndView("system-setup/section_setup");
		mav.addObject("sectionlist",sectionlist);
		mav.addObject("student", new Student());
		return mav;
	}
	
}