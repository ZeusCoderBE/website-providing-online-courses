package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
			dsbaihoc = bhD.GetListLesson(khoahoc);
			model.addAttribute("dsbaihoc", dsbaihoc);
			khoahocid=khoahoc;
		} catch (Exception ex) {

		}
		return "course";
	}
	@RequestMapping(value = "/FindDocuments", method = RequestMethod.GET, params = "mabaihoc")
	public String ShowDocumennt (ModelMap model, @RequestParam("mabaihoc") int mabaihoc) throws ClassNotFoundException, SQLException {
		String url="";
		try {
			BaiHoc baihoc =bhD.FindOfMyALesson(mabaihoc);
			if (baihoc!= null) {
				//tìm 1 bài học
				model.addAttribute("lesson",baihoc);
				List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
				KhoaHoc khoahoc = new KhoaHoc(baihoc.getMakhoahoc());
				dsbaihoc = bhD.GetListLesson(khoahoc);
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
