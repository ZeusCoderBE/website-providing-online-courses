package vn.iotstar.controller;

import vn.iotstar.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.sql.SQLException;
import java.util.*;

@Controller
public class CourseController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	KhoaHoc khoahocid =new KhoaHoc();
	@RequestMapping(value = "/courses", method = RequestMethod.GET, params = "makhoahoc")
	public String Courses(ModelMap model, @RequestParam("makhoahoc") int makhoahoc) {
		List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		try {
			dsbaihoc = bhD.GetScience(khoahoc);
			model.addAttribute("dsbaihoc", dsbaihoc);
			khoahocid=khoahoc;
		} catch (Exception ex) {

		}
		return "course";
	}

	@RequestMapping(value = "/FindLessons", method = RequestMethod.GET, params = "mabaihoc")
	public String ShowDocumennt (ModelMap model, @RequestParam("mabaihoc") int mabaihoc) throws ClassNotFoundException, SQLException {
		String url="";
		try {
			BaiHoc baihoc =bhD.FindOfMyLesson(mabaihoc);
			if (baihoc!= null) {
				model.addAttribute("lesson",baihoc);
				List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
				KhoaHoc khoahoc = new KhoaHoc(baihoc.getMakhoahoc());
				dsbaihoc = bhD.GetScience(khoahoc);
				model.addAttribute("dsbaihoc", dsbaihoc);
				url="course";
			}
			else
			{
				url="redirect:/courses";
			}
		} catch (Exception ex) {

		}

		return url;
	}
}
