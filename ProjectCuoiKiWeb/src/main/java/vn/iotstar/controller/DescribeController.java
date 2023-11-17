package vn.iotstar.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.BaiHoc;
import vn.iotstar.model.BaiHocDao;
import vn.iotstar.model.GiangVien;
import vn.iotstar.model.GioHang;
import vn.iotstar.model.GioHangDao;
import vn.iotstar.model.HocVien;
import vn.iotstar.model.KhoaHoc;
import vn.iotstar.model.KhoaHocDao;

@Controller
public class DescribeController {
	KhoaHocDao khD = new KhoaHocDao();
	BaiHocDao bhD = new BaiHocDao();
	GioHangDao ghD = new GioHangDao();

	@RequestMapping("/homepage")
	public String RollBackHomePage() {
		return "/homepage";
	}

	@RequestMapping(value = "/describe", method = RequestMethod.GET, params = "makhoahoc")
	public String XemMotKhoaHoc(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		KhoaHoc demdangky=new KhoaHoc();
		List<BaiHoc> ListBH = new ArrayList<BaiHoc>();
		try {
			if (hv != null && gv == null) {
				khoahoc = khD.FindCourseOfCustomer(khoahoc);
				model.addAttribute("khoahoc", khoahoc);
				ListBH = bhD.GetListLesson(khoahoc);
				model.addAttribute("listbaihoc", ListBH);
				List<GioHang> dsgiohang = new ArrayList<GioHang>();
				dsgiohang = ghD.GetMyCart(hv.getManguoidung());
				GioHang gh = ghD.CountCourse(hv.getManguoidung());
				demdangky=khD.CountSignIn(makhoahoc);
				model.addAttribute("countkhoahoc", gh);
				model.addAttribute("dsgiohang", dsgiohang);
				model.addAttribute("dem",demdangky);
				model.addAttribute("isdangky", khD.khoahocDangKy(hv.getManguoidung(), khoahoc.getMakhoahoc()));
			} else if (hv == null && gv != null) {
				khoahoc = khD.FindCourseOfCustomer(khoahoc);
				demdangky=khD.CountSignIn(makhoahoc);
				model.addAttribute("khoahoc", khoahoc);
				model.addAttribute("dem",demdangky);
				model.addAttribute("istao", khD.KhoaHocDaTao(gv.getManguoidung(), khoahoc.getMakhoahoc()));
			} else {
				demdangky=khD.CountSignIn(makhoahoc);
				khoahoc = khD.FindCourseOfCustomer(khoahoc);
				model.addAttribute("khoahoc", khoahoc);
				model.addAttribute("dem",demdangky);
			}

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return "describe";
	}
}
