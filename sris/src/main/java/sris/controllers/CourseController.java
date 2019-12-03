package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.CourseDao;

import sris.model.Student;


@Controller
public class CourseController {
	@Autowired
	CourseDao courseDao;

	@RequestMapping(value="course_setup/delete/{courseid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int courseid) {
		courseDao.delete(courseid);
		return new ModelAndView("redirect:/course_setup");
	}

	@RequestMapping(value="course_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		courseDao.save(student);
		return new ModelAndView("redirect:/course_setup");
	}
	
	@RequestMapping(value="course_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		courseDao.update(student);
		return new ModelAndView("redirect:/course_setup");
	}

}

	
	
