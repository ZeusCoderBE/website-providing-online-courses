package vn.iotstar.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.iotstar.model.BaiHoc;
import vn.iotstar.model.BaiHocDao;
import vn.iotstar.model.KhoaHoc;
import vn.iotstar.model.KhoaHocDao;

@Controller
public class LessonController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	BaiHoc baihoc;
	int makhoahoc;
	int mode;

	@RequestMapping(value = "/create-lesson-info", method = RequestMethod.GET, params = "makhoahoc")
	public String Lesson(ModelMap model, @RequestParam("makhoahoc") String _makhoahoc) {
		makhoahoc = Integer.parseInt(_makhoahoc);
		mode = 0;
		return "create_lesson";
	}

	@RequestMapping(value = "/edit-lesson-info", method = RequestMethod.GET)
	public String EditLesson(ModelMap model, @RequestParam("mabaihoc") String mabaihoc) {
		mode = 1;
		try {
			baihoc = bhD.FindOfMyALesson(Integer.parseInt(mabaihoc));
			makhoahoc = baihoc.getMakhoahoc();
			model.addAttribute("editbaihoc", baihoc);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "create_lesson";
	}

	@RequestMapping(value = "/post-lesson", method = RequestMethod.POST)
	public String CreateLesson(ModelMap model, @RequestParam("namelesson") String name,
			@RequestParam("tghoanthanh") String tghoanthanh, @RequestParam("daura") String muctieu,
			@RequestParam("textarea") String content) {
		BaiHoc bh = null;
		try {
			if (mode == 0) {
				bh = new BaiHoc(0, name, Double.parseDouble(tghoanthanh), content, Double.parseDouble(muctieu),
						null, makhoahoc);
				bhD.ThemBaiHoc(bh);
			} else {
				bh = new BaiHoc(baihoc.getMabaihoc(), name, Double.parseDouble(tghoanthanh), content,
						Double.parseDouble(muctieu), null, makhoahoc);
				bhD.CapNhatBaiHoc(bh);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/courses?makhoahoc=" + makhoahoc;
	}

	@RequestMapping(value = "/remove-lesson", method = RequestMethod.GET)
	public String RemoveLesson(ModelMap model, @RequestParam("mabaihoc") String mabaihoc) {
		try {
			baihoc = bhD.FindOfMyALesson(Integer.parseInt(mabaihoc));
			bhD.XoaBaiHoc(baihoc.getMabaihoc());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "redirect:courses?makhoahoc=" + baihoc.getMakhoahoc();
	}
}
