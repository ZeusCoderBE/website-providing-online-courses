package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.Date;
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
	KhoaHoc khoahocid = new KhoaHoc();
	GiangVienDao gvD = new GiangVienDao();

	@RequestMapping(value = "/courses", method = RequestMethod.GET, params = "makhoahoc")
	public String Courses(ModelMap model, @RequestParam("makhoahoc") int makhoahoc) {
		List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		try {
			dsbaihoc = bhD.GetListLesson(khoahoc);
			model.addAttribute("dsbaihoc", dsbaihoc);
			khoahocid = khoahoc;
		} catch (Exception ex) {

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
				List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
				KhoaHoc khoahoc = new KhoaHoc(baihoc.getMakhoahoc());
				dsbaihoc = bhD.GetListLesson(khoahoc);
				model.addAttribute("dsbaihoc", dsbaihoc);
				url = "course";
			} else {
				url = "redirect:/courses";
			}
		} catch (Exception ex) {

		}

		return url;
	}

	@RequestMapping(value = "/Create-Course", method = RequestMethod.GET)
	public String CreateCourse() {
		return "create_course";
	}

	@RequestMapping(value = "Find-Course", method = RequestMethod.GET, params = "makhoahoc")
	public String FindCourse(HttpSession session, @RequestParam("makhoahoc") int makhoahoc, ModelMap model)
			throws ClassNotFoundException, SQLException {
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		khoahocid = khoahoc;
		KhoaHoc ketqua = khD.FindCourseOfCustomer(khoahoc);
		String url = "";
		if (ketqua != null) {
			model.addAttribute("findkhoahoc", ketqua);
			url = "create_course";
		} else {
			session.setAttribute("thatbai", "Không Tìm Thấy Khoá Học");
			url = "redirect:/homepages";
		}
		return url;
	}

	@RequestMapping(value = "/Edit-Course", method = RequestMethod.POST)
	public String EditCourse(@RequestParam("tenkhoahoc") String tenkhoahoc, @RequestParam("theloai") String theloai,
			@RequestParam("matacgia") int matacgia, @RequestParam("giatien") double giatien,
			@RequestParam("trinhdodauvao") String trinhdo, @RequestParam("danhgia") int danhgia,
			@RequestParam("ngonngu") String ngonngu, @RequestParam("thoiluong") double thoiluong,
			@RequestParam("linhvuc") String linhvuc, @RequestParam("ngayphathanh") Date ngayphathanh,
			@RequestParam("textarea") String mota, ModelMap model, HttpSession session) {
		String url = "";
		try {
			String mess = "";
			KhoaHoc khoahoc = new KhoaHoc(khoahocid.getMakhoahoc(), tenkhoahoc, matacgia, giatien, ngonngu, thoiluong,
					trinhdo, ngayphathanh, mota, danhgia, theloai, linhvuc);
			if (khD.EditACourse(khoahoc) == 1) {
				mess = "Chúc mừng bạn đã sửa thành công một khoá học !";
				url = "redirect:/homepages";
				session.setAttribute("thongbaoedit", mess);
			} else {
				khoahoc = khD.FindCourseOfCustomer(khoahoc);
				model.addAttribute("editkhoahoc", khoahoc);
				mess = "Dường như có lỗi trong quá trình sửa";
				model.addAttribute("thongbaoedit", mess);
				url = "describe";
			}
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		return url;
	}

	@RequestMapping(value = "Delete-Course", method = RequestMethod.GET, params = "makhoahoc")
	public String RemoveCourse(@RequestParam("makhoahoc") int makhoahoc, HttpSession session, ModelMap model) {
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		String url = "";
		String mess = "";
		if (khD.RemoveAcourse(khoahoc) == 1) {
			mess = "Bạn đã xoá thành công một khoá học ! ";
			url = "redirect:/homepages";
			session.setAttribute("xoakh", mess);
		} else {
			mess = "Bạn đã xoá thất bại";
			url = "describe";
			model.addAttribute("xoakh", mess);

		}
		return url;
	}

	@RequestMapping(value = "/Create-Course", method = RequestMethod.POST)
	public String CreateCourse(@RequestParam("tenkhoahoc") String tenkhoahoc, @RequestParam("theloai") String theloai,
			@RequestParam("matacgia") int matacgia, @RequestParam("giatien") double giatien,
			@RequestParam("trinhdodauvao") String trinhdo, @RequestParam("danhgia") int danhgia,
			@RequestParam("ngonngu") String ngonngu, @RequestParam("thoiluong") double thoiluong,
			@RequestParam("linhvuc") String linhvuc, @RequestParam("ngayphathanh") Date ngayphathanh,
			@RequestParam("textarea") String mota, ModelMap model, HttpSession session) {
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		String url = "";
		try {
			String mess = "";
			KhoaHoc khoahoc = new KhoaHoc(0, tenkhoahoc, matacgia, giatien, ngonngu, thoiluong, trinhdo, ngayphathanh,
					mota, danhgia, theloai, linhvuc);
			if (khD.CreateACourse(khoahoc) == 1 && gvD.InsertCompilation(gv.getManguoidung()) == 1) {
				mess = "Chúc mừng bạn đã tạo thành công một khoá học ! ";
				url = "redirect:/homepages";
				session.setAttribute("thongbaotaokh", mess);
			} else {
				mess = "Dường như có lỗi trong quá trình tạo";
				model.addAttribute("thongbaotaokh", mess);
				url = "create_course";
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
	public String CreateLesson(ModelMap model, @RequestParam("namelesson") String name,
			@RequestParam("trinhdo") String muctieu, @RequestParam("textarea") String content) {

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
