package sris.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.SemesterDao;


import sris.model.Student;


@Controller
public class SemesterController {
	@Autowired
	SemesterDao semesterDao;

	@RequestMapping(value="semester_setup/delete/{semesterid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int semesterid) {
		semesterDao.delete(semesterid);
		return new ModelAndView("redirect:/semester_setup");
	}
	
	@RequestMapping(value="semester_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		semesterDao.save(student);
		return new ModelAndView("redirect:/semester_setup");
	}
	
	@RequestMapping(value="semester_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		semesterDao.update(student);
		return new ModelAndView("redirect:/semester_setup");
	}

}

	
	
