package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.SQLException;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(value = "mycourse", method = RequestMethod.GET, params = "manguoidung")
	public String ShowMyCourse(Model map, @RequestParam("manguoidung") int manguoidung)
			throws ClassNotFoundException, SQLException {
		List<KhoaHoc> dskhoahoccuatoi = null;
		try {
			HocVien hv = new HocVien(manguoidung);
			dskhoahoccuatoi = khD.FindMyLearning(hv);
			map.addAttribute("danhsachkhoahoc", dskhoahoccuatoi);
		} catch (Exception ex) {

		}
		return "course";
	}
}
