package sris.controllers;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.FacultyDao;
import sris.dao.GradesheetDao;
import sris.dao.PaginationDao;
import sris.dao.StudentDao;
import sris.dao.TORDao;
import sris.dao.StudentGradesDao;
import sris.model.Student;


@Controller
public class StudentController {
	@Autowired
	StudentDao studentDao;
	@Autowired
	StudentGradesDao studentgradesDao;
	@Autowired
	FacultyDao facultyDao;
	@Autowired
	TORDao torDao;
	@Autowired
	GradesheetDao gradesheetDao;
	@Autowired
	PaginationDao paginationDao;
	
	
	
	@RequestMapping(value="student_record_setup/search", method = RequestMethod.POST)
	public ModelAndView studrecordsearch(@ModelAttribute("student") Student student) {
		List<Student> studentlist = torDao.getStudent(student);
		List<Student> getstudent = studentDao.getStudent2();
		ModelAndView mav = new ModelAndView("system-setup/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="student_record_setup/view/{studentid}",method = RequestMethod.GET)
	public ModelAndView getGrades(@PathVariable int studentid) {
		List<Student> getstudentid = studentDao.getStudentid(studentid);
		List<Student> gradelist = studentDao.getGrades(studentid);
		List<Student> getfacultysubject = studentgradesDao.getfacultysubject();
		List<Student> getcourse = studentgradesDao.getcourse();
		List<Student> getsection = studentgradesDao.getsection();
		List<Student> getsemester = studentgradesDao.getsemester();
		List<Student> getsy = studentgradesDao.getsy();


		ModelAndView mav = new ModelAndView("system-setup/student_grades");
		mav.addObject("getstudentid",getstudentid);
		mav.addObject("gradelist",gradelist);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="student_record_setup/delete/{studentid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int studentid) {
		studentDao.delete(studentid);
		return new ModelAndView("redirect:/student_record_setup");
	}
	@RequestMapping(value="student_record_update/delete/{studentid}",method = RequestMethod.GET)
	public ModelAndView recorddelete(@PathVariable int studentid) {
		studentDao.delete(studentid);
		return new ModelAndView("redirect:/student_record_update");
	}
	
	@RequestMapping(value="student_record_util/restore/{studentid}",method = RequestMethod.GET)
	public ModelAndView restore(@PathVariable int studentid) {
		studentDao.restore(studentid);
		return new ModelAndView("redirect:/student_record_util");
	}
	@RequestMapping(value="student_record_util/restoreall")
	public ModelAndView restoreall() {
		studentDao.restoreall();
		return new ModelAndView("redirect:/student_record_util");
	}
	
	
	@RequestMapping(value="student_record_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		studentDao.save(student);
		List<Student> studentlist = studentDao.getsave(student);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("system-setup/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="student_record_setup/update", method = RequestMethod.POST)
	public ModelAndView srst_update(@ModelAttribute("student") Student student) {
		studentDao.update(student);
		List<Student> studentlist = studentDao.getupdate(student);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("system-setup/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="student_record_update/update", method = RequestMethod.POST)
	public ModelAndView recordupdate(@ModelAttribute("student") Student student) {
		studentDao.recordupdate(student);
		return new ModelAndView("redirect:/student_record_update");
	}
	
	@RequestMapping(value="student_record_update/{pagination}",method = RequestMethod.GET)
	public ModelAndView pagination(@PathVariable String pagination) {
		System.out.println(pagination);
		List<Student> studentlist = paginationDao.pagination(pagination);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("update/student_record_update");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
		
	/*USER*/
	@RequestMapping(value="user/student_record_setup/save", method = RequestMethod.POST)
	public ModelAndView usersave(@ModelAttribute("student") Student student) {
		studentDao.save(student);
		List<Student> studentlist = studentDao.getsave(student);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("user/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="user/student_record_setup/update", method = RequestMethod.POST)
	public ModelAndView userupdate(@ModelAttribute("student") Student student) {
		studentDao.update(student);
		List<Student> studentlist = studentDao.getupdate(student);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("user/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="user/student_record_setup/{pagination}",method = RequestMethod.GET)
	public ModelAndView user_pagination(@PathVariable String pagination) {
		List<Student> studentlist = paginationDao.pagination(pagination);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("user/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="student_record_setup/{pagination}",method = RequestMethod.GET)
	public ModelAndView admin_pagination(@PathVariable String pagination) {
		List<Student> studentlist = paginationDao.pagination(pagination);
		List<Student> getstudent = gradesheetDao.getStudent();	
		ModelAndView mav=new ModelAndView("system-setup/student_record_setup");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
}

	
	
