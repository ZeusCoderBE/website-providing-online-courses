package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.Date;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;<<<<<<<HEAD=======
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;>>>>>>>1d 03420d 52 b9193c06b2ec278864841d259bf365

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import java.io.File;

@Controller
public class CourseController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	KhoaHoc khoahocid = new KhoaHoc();
	GiangVienDao gvD = new GiangVienDao();
	@Autowired
	ServletContext context;
	int mode = 0;

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

	@RequestMapping(value = "/Create-Course", method = RequestMethod.GET)
	public String CreateCourse() {
		mode = 0;
		return "create_course";
	}

	@RequestMapping(value = "Find-Course", method = RequestMethod.GET, params = "makhoahoc")
	public String FindCourse(HttpSession session, @RequestParam("makhoahoc") int makhoahoc, ModelMap model)
			throws ClassNotFoundException, SQLException {
		mode = 1;
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

	@RequestMapping(value = "/Post-Course", method = RequestMethod.POST)
	public String EditCourse(@RequestParam("tenkhoahoc") String tenkhoahoc, @RequestParam("theloai") String theloai,
			@RequestParam("matacgia") int matacgia, @RequestParam("giatien") double giatien,
			@RequestParam("trinhdodauvao") String trinhdo, @RequestParam("ngonngu") String ngonngu,
			@RequestParam("thoiluong") double thoiluong, @RequestParam("linhvuc") String linhvuc,
			@RequestParam("ngayphathanh") Date ngayphathanh, @RequestParam("textarea") String mota,
			@RequestParam("minhhoa") MultipartFile minhhoa, ModelMap model, HttpSession session,
			MultipartHttpServletRequest rq) {
		String url = "";
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		try {
			String mess = "";
			String originname = "";

			// Lưu file ảnh thumbnail cho khóa học
			MultipartFile mul = rq.getFile(minhhoa.getName());
			if (mul != null) {
				originname = mul.getOriginalFilename();
				String upload = context.getRealPath("Images\\" + originname);
				File dest = new File(upload);
				mul.transferTo(dest);
			}

			KhoaHoc khoahoc = new KhoaHoc(khoahocid.getMakhoahoc(), tenkhoahoc, matacgia, giatien, ngonngu, thoiluong,
					trinhdo, ngayphathanh, mota, 0, theloai, linhvuc, originname);
			if (mode == 0) {
				if (khD.CreateACourse(khoahoc) == 1 && gvD.InsertCompilation(gv.getManguoidung()) == 1) {
					mess = "Chúc mừng bạn đã tạo thành công một khoá học ! ";
					url = "redirect:/homepages";
					session.setAttribute("thongbaotaokh", mess);
				} else {
					mess = "Dường như có lỗi trong quá trình tạo";
					model.addAttribute("thongbaotaokh", mess);
					url = "create_course";
				}
			} else if (mode == 1) {
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
}
