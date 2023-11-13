package vn.iotstar.controller;

import java.io.File;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.BaiHoc;
import vn.iotstar.model.BaiHocDao;
import vn.iotstar.model.KhoaHoc;
import vn.iotstar.model.KhoaHocDao;
import vn.iotstar.model.LamBaiTap;
import vn.iotstar.model.LamBaiTapDAO;

@Controller
public class LessonController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	LamBaiTapDAO lbtD = new LamBaiTapDAO();
	int makhoahoc;
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/edit-lesson-tool", method = RequestMethod.GET, params = "makhoahoc")
	public String Lesson(ModelMap model, @RequestParam("makhoahoc") String _makhoahoc) {
		makhoahoc = Integer.parseInt(_makhoahoc);
		return "create_lesson";
	}

	@RequestMapping(value = "/create-lesson", method = RequestMethod.POST)
	public String CreateLesson(ModelMap model, @RequestParam("namelesson") String name,
			@RequestParam("tghoanthanh") String tghoanthanh, @RequestParam("trinhdo") String muctieu,
			@RequestParam("textarea") String content) {
		
		BaiHoc bh = new BaiHoc(0, name, Double.parseDouble(tghoanthanh), content, Double.parseDouble(muctieu), null, makhoahoc);
		try {
			bhD.ThemBaiHoc(bh);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "redirect:/courses?makhoahoc=" + makhoahoc;
	}
	
	@RequestMapping(value= "/fileuploadservlet", method = RequestMethod.POST)
    public String SubmitBaiTap(MultipartHttpServletRequest rq, @RequestParam("mabaihoc") int mabaihoc, @RequestParam("manguoidung") int manguoidung, HttpSession session) 
    {
		//Thiếu tên bài tập
		//Hiện tại chỉ gán cứng tên bài tập để test, khi nào xong chức năng upload đề thì sửa lại
		//
		MultipartFile mul = rq.getFile("file");
		if (mul != null) {
			String originname = mul.getOriginalFilename();
			try {
				String upload = context.getRealPath("ResourceVideo\\" + originname);
				System.out.print(upload);
				File dest = new File(upload);
				mul.transferTo(dest);
				System.out.print("Download Successfull");
				@SuppressWarnings("null")
				//
				// Đường dẫn đang lưu cứng trên local người chạy project. Cần thay đổi để thích ứng với từng local khác nhau
				//
				LamBaiTap lbt = new LamBaiTap(manguoidung, "Bài tập 1", mabaihoc, upload);
				lbtD.NopBaiTap(lbt);
			} catch (Exception ex) {
				System.out.print(ex.getMessage());
				System.out.print("False");
			}
		}
		return "";
	}
}
