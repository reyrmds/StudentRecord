package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.SubjectsDao;
import sris.model.Student;


@Controller
public class SubjectController {
	@Autowired
	SubjectsDao subjectsDao;

	@RequestMapping(value="subject_setup/delete/{subjectid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int subjectid) {
		subjectsDao.delete(subjectid);
		return new ModelAndView("redirect:/subject_setup");
	}
	@RequestMapping(value="subject_record_update/delete/{subjectid}",method = RequestMethod.GET)
	public ModelAndView recorddelete(@PathVariable int subjectid) {
		subjectsDao.delete(subjectid);
		return new ModelAndView("redirect:/subject_record_update");
	}
	
	@RequestMapping(value="subject_util/restore/{subjectid}",method = RequestMethod.GET)
	public ModelAndView restore(@PathVariable int subjectid) {
		subjectsDao.restore(subjectid);
		return new ModelAndView("redirect:/subject_util");
	}
	@RequestMapping(value="subject_util/restoreall")
	public ModelAndView restoreall() {
		subjectsDao.restoreall();
		return new ModelAndView("redirect:/subject_util");
	}
	
	@RequestMapping(value="subject_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		subjectsDao.save(student);
		return new ModelAndView("redirect:/subject_setup");
	}
	
	@RequestMapping(value="subject_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		subjectsDao.update(student);
		return new ModelAndView("redirect:/subject_setup");
	}
	@RequestMapping(value="subject_record_update/update", method = RequestMethod.POST)
	public ModelAndView recordupdate(@ModelAttribute("student") Student student) {
		subjectsDao.recordupdate(student);
		return new ModelAndView("redirect:/subject_record_update");
	}
}

	
	
