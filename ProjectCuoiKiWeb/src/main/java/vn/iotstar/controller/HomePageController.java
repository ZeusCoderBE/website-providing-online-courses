package vn.iotstar.controller;

import vn.iotstar.model.*;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

@Controller
public class HomePageController {
	KhoaHocDao khD = new KhoaHocDao();
	BaiHocDao bhD = new BaiHocDao();
	GioHangDao ghD = new GioHangDao();
	NguoiDungDao ndD = new NguoiDungDao();
	HocVienDao hvD = new HocVienDao();
	GiangVienDao gvD = new GiangVienDao();

	@RequestMapping(value = "/homepages", method = RequestMethod.GET)
	public String homePage(ModelMap model, HttpSession session) throws Exception {
		List<KhoaHoc> ListKH = null;
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		try {
			if (hv == null && gv == null) {
				ListKH = khD.GetListCourses();
				model.addAttribute("danhsachkh", ListKH);
				model.addAttribute("thongbaokhach",
						"Bạn đang vào trang web này với vai trò là khách nếu bạn muốn đăng ký khóa học vui lòng tạo tài khoản !");
			} else if (hv != null && gv == null) {
				ListKH = khD.GetListCourses();
				model.addAttribute("danhsachkh", ListKH);
				List<GioHang> dsgiohang = new ArrayList<GioHang>();
				dsgiohang = ghD.GetTopMyCart(hv.getManguoidung());
				GioHang gh = ghD.CountCourse(hv.getManguoidung());
				HocVien hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
				model.addAttribute("thongtin", hocvien);
				model.addAttribute("countkhoahoc", gh);
				model.addAttribute("dsgiohang", dsgiohang);

			} else if (gv != null && hv == null) {
				GiangVien giangvien = gvD.TimThongTinDN_id(gv.getManguoidung());
				model.addAttribute("thongtin", giangvien);
				ListKH = khD.GetListCourses();
				model.addAttribute("danhsachkh", ListKH);
			}

		} catch (Exception ex) {

		}

		return "homepage";
	}

	@RequestMapping(value = "introduction", method = RequestMethod.GET)
	public String ShowIntroduction() {
		return "introduction";
	}

	@RequestMapping(value = "/myhomepage", method = RequestMethod.GET)
	public String FindMyLearning(HttpSession session, ModelMap model) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		List<KhoaHoc> dskhoahoc = new ArrayList<KhoaHoc>();
		try {
			if (hv != null && gv == null) {
				dskhoahoc = khD.FindMyLearning(hv.getManguoidung());
				model.addAttribute("danhsachkhoahoc", dskhoahoc);
				model.addAttribute("check", 0);
				List<GioHang> dsgiohang = new ArrayList<GioHang>();
				dsgiohang = ghD.GetTopMyCart(hv.getManguoidung());
				GioHang gh = ghD.CountCourse(hv.getManguoidung());
				model.addAttribute("countkhoahoc", gh);
				model.addAttribute("dsgiohang", dsgiohang);
			} else {
				dskhoahoc = khD.ShowMyCreateOfCourse(gv.getManguoidung());
				model.addAttribute("danhsachkhoahoc", dskhoahoc);
				model.addAttribute("check", 0);
			}

		} catch (Exception ex) {
				System.out.print(ex.getMessage());
		}
		return "homepage";
	}

	
}
