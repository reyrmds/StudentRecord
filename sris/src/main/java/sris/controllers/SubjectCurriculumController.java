package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.CourseDao;
import sris.dao.SubjectCurriculumDao;
import sris.model.Student;


@Controller
public class SubjectCurriculumController {
	@Autowired
	SubjectCurriculumDao subjectcurriculumDao;

	@RequestMapping(value="subject_curriculum_setup/delete/{refid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int refid) {
		subjectcurriculumDao.delete(refid);
		return new ModelAndView("redirect:/subject_curriculum_setup");
	}

	@RequestMapping(value="subject_curriculum_setup/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		subjectcurriculumDao.save(student);
		return new ModelAndView("redirect:/subject_curriculum_setup");
	}
	
	@RequestMapping(value="subject_curriculum_setup/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		subjectcurriculumDao.update(student);
		return new ModelAndView("redirect:/subject_curriculum_setup");
	}

}

	
	
