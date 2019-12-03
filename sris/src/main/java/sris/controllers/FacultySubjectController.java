package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.FacultySubjectDao;

import sris.model.Student;


@Controller
public class FacultySubjectController {
	@Autowired
	FacultySubjectDao facultysubjectDao;

	@RequestMapping(value="faculty_subject_setup/delete/{facultysubjectid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int facultysubjectid) {
		facultysubjectDao.delete(facultysubjectid);
		return new ModelAndView("redirect:/faculty_subject_setup");
	}
	
	@RequestMapping(value="faculty_subject_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		facultysubjectDao.save(student);
		return new ModelAndView("redirect:/faculty_subject_setup");
	}
	
	@RequestMapping(value="faculty_subject_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		facultysubjectDao.update(student);
		return new ModelAndView("redirect:/faculty_subject_setup");
	}
	
	@RequestMapping(value="faculty_subject_util/restore/{facultyid}",method = RequestMethod.GET)
	public ModelAndView restore(@PathVariable int facultyid) {
		facultysubjectDao.restore(facultyid);
		return new ModelAndView("redirect:/faculty_subject_util");
	}
	@RequestMapping(value="faculty_subject_util/restoreall")
	public ModelAndView restoreall() {
		facultysubjectDao.restoreall();
		return new ModelAndView("redirect:/faculty_subject_util");
	}
	
}

	
	
