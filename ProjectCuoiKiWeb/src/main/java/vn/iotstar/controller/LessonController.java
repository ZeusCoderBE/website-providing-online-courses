package vn.iotstar.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.iotstar.model.BaiHoc;
import vn.iotstar.model.BaiHocDao;
import vn.iotstar.model.KhoaHoc;
import vn.iotstar.model.KhoaHocDao;

@Controller
public class LessonController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	int makhoahoc;
	
	@RequestMapping(value = "/edit-lesson-tool", method = RequestMethod.GET, params = "makhoahoc")
	public String Lesson(ModelMap model, @RequestParam("makhoahoc") String _makhoahoc) {
		makhoahoc = Integer.parseInt(_makhoahoc);
		return "create_lesson";
	}

	@RequestMapping(value = "/create-lesson", method = RequestMethod.POST)
	public String CreateLesson(ModelMap model, @RequestParam("namelesson") String name,
			@RequestParam("tghoanthanh") String tghoanthanh, @RequestParam("trinhdo") String muctieu,
			@RequestParam("textarea") String content) {
		
		BaiHoc bh = new BaiHoc(8, name, Double.parseDouble(tghoanthanh), content, Double.parseDouble(muctieu), null, makhoahoc);
		try {
			bhD.ThemBaiHoc(bh);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "redirect:/courses?makhoahoc=" + makhoahoc;
	}
}
