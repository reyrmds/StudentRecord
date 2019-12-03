package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import sris.dao.StudentGradesDao;
import sris.model.Student;


@Controller
@RequestMapping(value="student_record_setup/view")
public class StudentGradesController {
	@Autowired
	StudentGradesDao studentgradesDao;
	
	
	@RequestMapping(value="student_grades/delete/{recordid}/{studentid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int recordid ,@PathVariable int studentid) {
		studentgradesDao.delete(recordid);
		return new ModelAndView("redirect:/student_record_setup/view/"+studentid+"");
	}
	
	@RequestMapping(value="student_grades/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		studentgradesDao.save(student);
		return new ModelAndView("redirect:/student_record_setup/view/"+student.getStudent_id()+"");
	}
	
	@RequestMapping(value="student_grades/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		studentgradesDao.update(student);
		return new ModelAndView("redirect:/student_record_setup/view/"+student.getStudent_id()+"");
	}
}

	
	
