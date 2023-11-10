package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import java.util.*;

@Controller
public class CourseController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	KhoaHoc khoahocid;

	@RequestMapping(value = "/courses", method = RequestMethod.GET, params = "makhoahoc")
	public String Courses(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc) {
		List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		model.addAttribute("makhoahoc", makhoahoc);
		try {
			dsbaihoc = bhD.GetListLesson(khoahoc);
			model.addAttribute("dsbaihoc", dsbaihoc);
			khoahocid = khoahoc;
		} catch (Exception ex) {
			model.addAttribute("warning", ex.getMessage());
		}
		return "course";
	}

	@RequestMapping(value = "/FindDocuments", method = RequestMethod.GET, params = "mabaihoc")
	public String ShowDocumennt(ModelMap model, @RequestParam("mabaihoc") int mabaihoc)
			throws ClassNotFoundException, SQLException {
		String url = "";
		try {
			BaiHoc baihoc = bhD.FindOfMyALesson(mabaihoc);
			if (baihoc != null) {
				// tìm 1 bài học
				model.addAttribute("lesson", baihoc);
				model.addAttribute("makhoahoc", baihoc.getMakhoahoc());
				List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
				KhoaHoc khoahoc = new KhoaHoc(baihoc.getMakhoahoc());
				dsbaihoc = bhD.GetListLesson(khoahoc);
				model.addAttribute("dsbaihoc", dsbaihoc);
				url = "course";
			} else {
				url = "redirect:/courses";
			}
		} catch (Exception ex) {
			model.addAttribute("warning", ex.getMessage());
		}

		return url;
	}
}
