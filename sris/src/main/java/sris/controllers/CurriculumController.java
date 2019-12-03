package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.CurriculumDao;
import sris.model.Student;


@Controller
public class CurriculumController {
	@Autowired
	CurriculumDao curriculumDao;


	@RequestMapping(value="curriculum_setup/delete/{curriculumid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int curriculumid) {
		curriculumDao.delete(curriculumid);
		return new ModelAndView("redirect:/curriculum_setup");
	}

	@RequestMapping(value="curriculum_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		curriculumDao.save(student);
		return new ModelAndView("redirect:/curriculum_setup");
	}
	
	@RequestMapping(value="curriculum_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		curriculumDao.update(student);
		return new ModelAndView("redirect:/curriculum_setup");
	}

	
}

	
	
