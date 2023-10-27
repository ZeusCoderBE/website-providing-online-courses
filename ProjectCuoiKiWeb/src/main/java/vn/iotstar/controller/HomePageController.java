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
public class HomePageController {
	KhoaHocDao khD = new KhoaHocDao();

	@RequestMapping(value = "/introduction", method = RequestMethod.GET)
	public String intro() {
		return "introduction";
	}

	@RequestMapping(value = "/homepages", method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		List<KhoaHoc> ListKH = null;
		try {
			ListKH = khD.GetListCourses();
			model.addAttribute("danhsachkh", ListKH);

		} catch (Exception ex) {
			
		}

		return "homepage";
	}
	@RequestMapping(value = "/describe", method = RequestMethod.GET, params = "MaKhoaHoc")
	public String XemMotKhoaHoc(ModelMap model, @RequestParam("MaKhoaHoc") int makhoahoc) {
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		try {
			khoahoc = khD.FindCourseOfCustomer(khoahoc);
			model.addAttribute("khoahoc", khoahoc);

		} catch (Exception ex) {

		}

		return "describe";
	}
}
