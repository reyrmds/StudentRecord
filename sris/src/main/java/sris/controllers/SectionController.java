package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.SectionDao;


import sris.model.Student;


@Controller
public class SectionController {
	@Autowired
	SectionDao sectionDao;

	@RequestMapping(value="section_setup/delete/{sectionid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int sectionid) {
		sectionDao.delete(sectionid);
		return new ModelAndView("redirect:/section_setup");
	}
	
	@RequestMapping(value="section_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		sectionDao.save(student);
		return new ModelAndView("redirect:/section_setup");
	}
	
	@RequestMapping(value="section_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		sectionDao.update(student);
		return new ModelAndView("redirect:/section_setup");
	}

}

	
	
