package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.criteria.Path;
import jakarta.servlet.http.HttpSession;

import java.util.*;

@Controller
public class CourseController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	KhoaHoc khoahocid = new KhoaHoc();
	GiangVienDao gvD = new GiangVienDao();

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

	@RequestMapping(value = "/FindDocuments", method = RequestMethod.GET, params = "mabaihoc")
	public String ShowDocumennt(ModelMap model, @RequestParam("mabaihoc") int mabaihoc)
			throws ClassNotFoundException, SQLException {
		String url = "";
		try {
			BaiHoc baihoc = bhD.FindOfMyALesson(mabaihoc);
			if (baihoc != null) {
				// tìm 1 bài học
				model.addAttribute("lesson", baihoc);
				model.addAttribute("makhoahoc", baihoc.getMakhoahoc());
				List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
				KhoaHoc khoahoc = new KhoaHoc(baihoc.getMakhoahoc());
				dsbaihoc = bhD.GetListLesson(khoahoc);
				model.addAttribute("dsbaihoc", dsbaihoc);
				url = "course";
			} else {
				url = "redirect:/courses";
			}
		} catch (Exception ex) {
			model.addAttribute("warning", ex.getMessage());
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
	@RequestMapping(value = "/Submit-Practice", method = RequestMethod.POST)
	public String createCourse(@RequestParam("file") MultipartFile file, ModelMap model, HttpSession session) {
        String uploadDirectory = "./templates/ResourceFile/";

        if (file != null && !file.isEmpty()) {
            try {
                // Lấy tên của file
                String fileName = file.getOriginalFilename();

                // Tạo đường dẫn cho file đã tải lên
                Path path = (Path) Paths.get(uploadDirectory, fileName);
                File fileDestination = ((java.nio.file.Path) path).toFile();
                // Lưu file đã tải lên vào thư mục được chỉ định
                file.transferTo(fileDestination);

                // Thêm thông báo thành công vào model
                model.addAttribute("message", "File uploaded successfully!");
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("message", "Error occurred while uploading file!");
                return "create_lesson";
            }
        } else {
            model.addAttribute("message", "Please select a file before submitting.");
            return "pay";
        }


        return "create_course";
    }
}
