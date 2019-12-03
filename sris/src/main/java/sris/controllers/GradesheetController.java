package sris.controllers;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import sris.dao.FacultyDao;
import sris.dao.GradesheetDao;

import sris.model.Student;


@Controller
public class GradesheetController {
@Autowired
GradesheetDao gradesheetDao;
@Autowired
FacultyDao facultyDao;
	
	@RequestMapping(value="gradesheet/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("student") Student student) {
		gradesheetDao.save(student);
		List<Student> getrecord = gradesheetDao.getRecord(student);
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("reports/generate_gradesheet");
		mav.addObject("getrecord",getrecord);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		return mav;
	}
	
	@RequestMapping(value="gradesheet/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("student") Student student) {
		gradesheetDao.update(student);
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getrecord = gradesheetDao.getRecord(student);
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("reports/generate_gradesheet");
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getrecord",getrecord);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="gradesheet_record/save", method = RequestMethod.POST)
	public ModelAndView save_record(@ModelAttribute("student") Student s) {
		gradesheetDao.save_record(s);
		return new ModelAndView("redirect:/gradesheet/view/"+s.getCourse_id()+"/"+s.getSection_id()+"/"+s.getSy_id()+"/"+s.getSemester_id()+"/"+s.getFacultysubject_id()+"");
	}
	
	@RequestMapping(value="gradesheet_record/update", method = RequestMethod.POST)
	public ModelAndView update_record(@ModelAttribute("student") Student s) {
		gradesheetDao.update_record(s);		
		return new ModelAndView("redirect:/gradesheet/view/"+s.getCourse_id()+"/"+s.getSection_id()+"/"+s.getSy_id()+"/"+s.getSemester_id()+"/"+s.getFacultysubject_id()+"");
	}
	@RequestMapping(value="gradesheet_record/delete", method = RequestMethod.POST)
	public ModelAndView delete_record(@ModelAttribute("student") Student s) {
		gradesheetDao.delete_record(s);		
		return new ModelAndView("redirect:/gradesheet/view/"+s.getCourse_id()+"/"+s.getSection_id()+"/"+s.getSy_id()+"/"+s.getSemester_id()+"/"+s.getFacultysubject_id()+"");
	}

	@RequestMapping(value="gradesheet/view/{courseid}/{sectionid}/{syid}/{semesterid}/{facultysubjectid}",method = RequestMethod.GET)
	public ModelAndView getGrades(@PathVariable int courseid,@PathVariable int sectionid,@PathVariable int syid,@PathVariable int semesterid,@PathVariable int facultysubjectid) {
		List <Student> getgradesheet = gradesheetDao.getGradesheet(courseid,sectionid,syid,semesterid,facultysubjectid);
		List <Student> getgradesheet1 = gradesheetDao.getGradesheet1(courseid,sectionid,syid,semesterid,facultysubjectid);
		List <Student> getstudent = gradesheetDao.getStudent();
		ModelAndView mav = new ModelAndView("reports/gradesheet_record");
		mav.addObject("getgradesheet",getgradesheet);
		mav.addObject("getgradesheet1",getgradesheet1);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}

	@RequestMapping(value="gradesheet/search", method = RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("student") Student student) {
		List<Student> getrecord = gradesheetDao.getRecord(student);
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("reports/generate_gradesheet");
		mav.addObject("getrecord",getrecord);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="gradesheet/print", method = RequestMethod.POST)
	public ModelAndView report() {
		return new ModelAndView("reports/gradesheet");	
	}
	
	@RequestMapping(value="user/gradesheet/search", method = RequestMethod.POST)
	public ModelAndView usersearch(@ModelAttribute("student") Student student) {
		List<Student> getrecord = gradesheetDao.getRecord(student);
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("user/generate_gradesheet");
		mav.addObject("getrecord",getrecord);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	
	@RequestMapping(value="user/gradesheet/print", method = RequestMethod.POST)
	public ModelAndView user_report() {
		return new ModelAndView("user/gradesheet");	
	}
	

	@RequestMapping(value="user/gradesheet/save", method = RequestMethod.POST)
	public ModelAndView user_save(@ModelAttribute("student") Student student) {
		gradesheetDao.save(student);
		List<Student> getrecord = gradesheetDao.getRecord(student);
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("user/generate_gradesheet");
		mav.addObject("getrecord",getrecord);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		return mav;
	}
	
	@RequestMapping(value="user/gradesheet/update", method = RequestMethod.POST)
	public ModelAndView user_update(@ModelAttribute("student") Student student) {
		gradesheetDao.update(student);
		List<Student> getrecord = gradesheetDao.getRecord(student);
		List<Student> getsubject = gradesheetDao.getfacultysubject();
		List<Student> getfacultysubject = gradesheetDao.getfacultysubject();
		List<Student> getcourse = gradesheetDao.getcourse();
		List<Student> getsection = gradesheetDao.getsection();
		List<Student> getsemester = gradesheetDao.getsemester();
		List<Student> getsy = gradesheetDao.getsy();
		ModelAndView mav = new ModelAndView("user/generate_gradesheet");
		mav.addObject("getrecord",getrecord);
		mav.addObject("getsubject",getsubject);
		mav.addObject("getfacultysubject",getfacultysubject);
		mav.addObject("getcourse",getcourse);
		mav.addObject("getsection",getsection);
		mav.addObject("getsemester",getsemester);
		mav.addObject("getsy",getsy);
		mav.addObject("student", new Student());
		return mav;
	}
	
	@RequestMapping(value="user/gradesheet_record/save", method = RequestMethod.POST)
	public ModelAndView user_save_record(@ModelAttribute("student") Student s) {
		gradesheetDao.save_record(s);
		return new ModelAndView("redirect:/user/gradesheet/view/"+s.getCourse_id()+"/"+s.getSection_id()+"/"+s.getSy_id()+"/"+s.getSemester_id()+"/"+s.getFacultysubject_id()+"");
	}
	
	@RequestMapping(value="user/gradesheet_record/update", method = RequestMethod.POST)
	public ModelAndView user_update_record(@ModelAttribute("student") Student s) {
		gradesheetDao.update_record(s);		
		return new ModelAndView("redirect:/user/gradesheet/view/"+s.getCourse_id()+"/"+s.getSection_id()+"/"+s.getSy_id()+"/"+s.getSemester_id()+"/"+s.getFacultysubject_id()+"");
	}
	
	@RequestMapping(value="user/gradesheet_record/delete", method = RequestMethod.POST)
	public ModelAndView user_delete_record(@ModelAttribute("student") Student s) {
		gradesheetDao.delete_record(s);		
		return new ModelAndView("redirect:/user/gradesheet/view/"+s.getCourse_id()+"/"+s.getSection_id()+"/"+s.getSy_id()+"/"+s.getSemester_id()+"/"+s.getFacultysubject_id()+"");
	}
	

	@RequestMapping(value="user/gradesheet/view/{courseid}/{sectionid}/{syid}/{semesterid}/{facultysubjectid}",method = RequestMethod.GET)
	public ModelAndView getGrades_us(@PathVariable int courseid,@PathVariable int sectionid,@PathVariable int syid,@PathVariable int semesterid,@PathVariable int facultysubjectid) {
		List <Student> getgradesheet = gradesheetDao.getGradesheet(courseid,sectionid,syid,semesterid,facultysubjectid);
		List <Student> getgradesheet1 = gradesheetDao.getGradesheet1(courseid,sectionid,syid,semesterid,facultysubjectid);
		List <Student> getstudent = gradesheetDao.getStudent();
		ModelAndView mav = new ModelAndView("user/gradesheet_record");
		mav.addObject("getgradesheet",getgradesheet);
		mav.addObject("getgradesheet1",getgradesheet1);
		mav.addObject("getstudent",getstudent);
		mav.addObject("student", new Student());
		return mav;
	}
	
	
}

	
	
