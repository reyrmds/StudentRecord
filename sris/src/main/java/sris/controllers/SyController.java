package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import sris.dao.SyDao;
import sris.model.Student;


@Controller
public class SyController {
	@Autowired
	SyDao syDao;

	@RequestMapping(value="sy_setup/delete/{syid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int syid) {
		syDao.delete(syid);
		return new ModelAndView("redirect:/sy_setup");
	}
	
	@RequestMapping(value="sy_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		syDao.save(student);
		return new ModelAndView("redirect:/sy_setup");
	}
	
	@RequestMapping(value="sy_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		syDao.update(student);
		return new ModelAndView("redirect:/sy_setup");
	}

}

	
	
