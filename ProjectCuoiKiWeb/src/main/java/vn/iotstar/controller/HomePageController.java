package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomePageController {
	KhoaHocDao khD = new KhoaHocDao();
	BaiHocDao bhD = new BaiHocDao();

	@RequestMapping(value = "/", method = RequestMethod.GET)
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
	@RequestMapping(value="/myhomepage",method=RequestMethod.GET)
	public String FindMyLearning(HttpSession session,Model map)
	{
		HocVien hv=(HocVien)session.getAttribute("hocvien");
		List<KhoaHoc> dskhoahoccuatoi=new ArrayList<KhoaHoc>();
		try		
		{
			dskhoahoccuatoi = khD.FindMyLearning(hv.getManguoidung());
			map.addAttribute("danhsachkhoahoc", dskhoahoccuatoi);
			map.addAttribute("check",0);
			
		}
		catch(Exception ex)
		{
			
		}
		return "homepage";
	}
	@RequestMapping(value = "/describe", method = RequestMethod.GET, params = "makhoahoc")
	public String XemMotKhoaHoc(ModelMap model, HttpSession session,@RequestParam("makhoahoc") int makhoahoc) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		List<BaiHoc> ListBH = new ArrayList<BaiHoc>();
		try {
			khoahoc = khD.FindCourseOfCustomer(khoahoc);
			model.addAttribute("khoahoc", khoahoc);
			ListBH = bhD.GetScience(khoahoc);
			model.addAttribute("listbaihoc", ListBH);
			model.addAttribute("isdangky", khD.khoahocDangKy(hv.getManguoidung(), khoahoc.getMakhoahoc()));

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return "describe";
	}
}
