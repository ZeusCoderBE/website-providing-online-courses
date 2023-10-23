package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CourseController {
	@RequestMapping(value="/courses", method=RequestMethod.GET)
	public String Courses(ModelMap model)
	{
		return "course";
	}
}
