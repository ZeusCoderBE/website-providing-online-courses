package vn.iotstar.controller;

import vn.iotstar.model.*;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomePageController {
	KhoaHocDao khD = new KhoaHocDao();
	BaiHocDao bhD = new BaiHocDao();
	GioHangDao ghD = new GioHangDao();
	NguoiDungDao ndD = new NguoiDungDao();
	HocVienDao hvD = new HocVienDao();
	GiangVienDao gvD = new GiangVienDao();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String intro() {
		return "introduction";
	}

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

		}
		return "homepage";
	}

	@RequestMapping(value = "/Create-Course", method = RequestMethod.GET)
	public String CreateCourse() {
		return "create_course";
	}

	@RequestMapping(value = "/describe", method = RequestMethod.GET, params = "makhoahoc")
	public String XemMotKhoaHoc(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
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
				model.addAttribute("countkhoahoc", gh);
				model.addAttribute("dsgiohang", dsgiohang);
				model.addAttribute("isdangky", khD.khoahocDangKy(hv.getManguoidung(), khoahoc.getMakhoahoc()));
			} else {
				khoahoc = khD.FindCourseOfCustomer(khoahoc);
				model.addAttribute("khoahoc", khoahoc);
				ListBH = bhD.GetListLesson(khoahoc);
				model.addAttribute("listbaihoc", ListBH);
			}

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return "describe";
	}
}
