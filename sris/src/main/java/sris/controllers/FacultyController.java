package sris.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.FacultyDao;
import sris.model.Student;


@Controller
public class FacultyController {
	@Autowired
	FacultyDao facultyDao;

	@RequestMapping(value="faculty_setup/delete/{facultyid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int facultyid) {
		facultyDao.delete(facultyid);
		return new ModelAndView("redirect:/faculty_setup");
	}
	@RequestMapping(value="faculty_record_update/delete/{facultyid}",method = RequestMethod.GET)
	public ModelAndView recorddelete(@PathVariable int facultyid) {
		facultyDao.delete(facultyid);
		return new ModelAndView("redirect:/faculty_record_update");
	}
	
	@RequestMapping(value="faculty_record_update/update", method = RequestMethod.POST)
	public ModelAndView recordupdate(@ModelAttribute("student") Student student) {
		facultyDao.recordupdate(student);
		return new ModelAndView("redirect:/faculty_record_update");
	}
	
	@RequestMapping(value="faculty_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		facultyDao.save(student);
		return new ModelAndView("redirect:/faculty_setup");
	}
	
	
	@RequestMapping(value="faculty_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		facultyDao.update(student);
		return new ModelAndView("redirect:/faculty_setup");
	}
	
	@RequestMapping(value="faculty_util/restore/{facultyid}",method = RequestMethod.GET)
	public ModelAndView restore(@PathVariable int facultyid) {
		facultyDao.restore(facultyid);
		return new ModelAndView("redirect:/faculty_util");
	}
	@RequestMapping(value="faculty_util/restoreall")
	public ModelAndView restoreall() {
		facultyDao.restoreall();
		return new ModelAndView("redirect:/faculty_util");
	}
	
}

	
	
