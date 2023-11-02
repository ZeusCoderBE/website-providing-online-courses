package vn.iotstar.controller;

import vn.iotstar.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CourseController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();

	@RequestMapping(value = "/courses", method = RequestMethod.GET, params = "makhoahoc")
	public String Courses(ModelMap model, @RequestParam("makhoahoc") int makhoahoc) {

		return "course";
	}
	
}
