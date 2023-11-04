package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.SQLException;
import java.util.Date;
//import java.sql.Date;
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
	@RequestMapping(value = "/createlesson", method = RequestMethod.GET)
	public String Lesson(ModelMap model) {
		return "create_lesson";
	}
	@RequestMapping(value = "/createlesson", method = RequestMethod.POST)
	public String CreateLesson(ModelMap model, @RequestParam("namelesson") String name, @RequestParam("trinhdo") String muctieu,
			@RequestParam("textarea") String content) {

		BaiHoc bh = new BaiHoc(6, name, 30.0, content, Double.parseDouble(muctieu), null, 1);
		try {
			if (bhD.ThemBaiHoc(bh) == 0) {
				System.out.println("Them bai hoc that bai");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "homepage";
	}
}
