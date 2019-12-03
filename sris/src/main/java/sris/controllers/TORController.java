package sris.controllers;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import sris.dao.TORDao;
import sris.dao.StudentDao;
import sris.model.Student;


@Controller
public class TORController {
	@Autowired
	TORDao torDao;
	@Autowired
	StudentDao studentDao;


	@RequestMapping(value="student-tor/search", method = RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("student") Student student) {
		List<Student> studentlist = torDao.getStudent(student);
		List<Student> getStudent = studentDao.getStudent2();
		ModelAndView mav = new ModelAndView("reports/generate_student_tor");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getStudent",getStudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="student-tor/print", method = RequestMethod.POST)
	public ModelAndView report() {
		return new ModelAndView("user/student-tor");
		
	}
	
	@RequestMapping(value="user/student-tor/search", method = RequestMethod.POST)
	public ModelAndView usersearch(@ModelAttribute("student") Student student) {
		List<Student> studentlist = torDao.getStudent(student);
		List<Student> getStudent = studentDao.getStudent2();
		ModelAndView mav = new ModelAndView("user/generate_student_tor");
		mav.addObject("studentlist",studentlist);
		mav.addObject("getStudent",getStudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="user/student-tor/print", method = RequestMethod.POST)
	public ModelAndView userreport() {
		return new ModelAndView("user/student-tor");
		
	}
	
}

	
	
