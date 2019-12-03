package sris.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sris.dao.UserDao;
import sris.model.Student;


@Controller
public class UserController {
	@Autowired
	UserDao userdao;

	@RequestMapping(value="user_management/delete/{userid}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int userid) {
		userdao.delete(userid);
		return new ModelAndView("redirect:/user_management");
	}
	
	@RequestMapping(value="user_management/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		userdao.save(student);
		return new ModelAndView("redirect:/user_management");
	}
	
	@RequestMapping(value="user_management/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		userdao.update(student);
		return new ModelAndView("redirect:/user_management");
	}
	
	@RequestMapping(value="user_util/restore/{userid}",method = RequestMethod.GET)
	public ModelAndView restore(@PathVariable int userid) {
		userdao.restore(userid);
		return new ModelAndView("redirect:/user_util");
	}
	@RequestMapping(value="user_util/restoreall")
	public ModelAndView restoreall() {
		userdao.restoreall();
		return new ModelAndView("redirect:/user_util");
	}
	
}

	
	
