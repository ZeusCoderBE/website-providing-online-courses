package vn.iotstar.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
import vn.iotstar.model.TaiLieu;
import vn.iotstar.model.TaiLieuDao;

@Controller
public class LessonController {
	BaiHocDao bhD = new BaiHocDao();
	KhoaHocDao khD = new KhoaHocDao();
	TaiLieuDao tlD = new TaiLieuDao();
	BaiHoc baihoc;
	int makhoahoc;
	int mode;
	int mabaihoc;
	int modedoucument;
	@Autowired
	ServletContext context;

	@RequestMapping(value = "/create-lesson-info", method = RequestMethod.GET, params = "makhoahoc")
	public String Lesson(ModelMap model, @RequestParam("makhoahoc") String _makhoahoc) {
		makhoahoc = Integer.parseInt(_makhoahoc);
		mode = 0;
		return "create_lesson";
	}

	@RequestMapping(value = "/create-document", method = RequestMethod.GET, params = "mabaihoc")
	public String Document(@RequestParam("mabaihoc") int mabaihoc) {
		this.mabaihoc = mabaihoc;
		modedoucument = 0;
		return "create_document";
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
				makhoahoc = baihoc.getMakhoahoc();
				List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
				List<TaiLieu> dstailieu = new ArrayList<>();
				dstailieu = bhD.FindDocumentofMylesson(mabaihoc);
				model.addAttribute("dstailieu", dstailieu);
				KhoaHoc khoahoc = new KhoaHoc(baihoc.getMakhoahoc());
				dsbaihoc = bhD.GetListLesson(khoahoc);
				model.addAttribute("dsbaihoc", dsbaihoc);
				url = "course";
			} else {
				url = "redirect:/courses";
			}
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return url;
	}

	@RequestMapping(value = "/post-document", method = RequestMethod.POST)
	public String CreateDocumentofLesson(@RequestParam("theloai") String theloai,
			@RequestParam("dinhdang") String dinhdang, MultipartHttpServletRequest rq, ModelMap model,
			HttpSession session)

	{
		System.out.print("davaoday");
		MultipartFile mul = rq.getFile("user-file");
		String url = "";
		if (mul != null) {
			String originname = mul.getOriginalFilename();
			try {
				String upload = context.getRealPath("Resource\\ResourceDocument\\" + originname);
				File dest = new File(upload);
				mul.transferTo(dest);
				TaiLieu tailieu = new TaiLieu(theloai, dinhdang, originname);
				if (tlD.CreateDocument(tailieu) == 1 && tlD.CreateAttachment(mabaihoc) == 1) {

					url = "redirect:/courses?makhoahoc=" + makhoahoc;
				} else {
					model.addAttribute("uptailieu", "Có lỗi xảy ra !");
				}

			} catch (Exception ex) {
				System.out.print(ex.getMessage());
			}
		}
		return url;
	}

	@RequestMapping(value = "/edit-lesson-info", method = RequestMethod.GET)
	public String EditLesson(ModelMap model, @RequestParam("mabaihoc") String mabaihoc) {
		mode = 1;
		try {
			baihoc = bhD.FindOfMyALesson(Integer.parseInt(mabaihoc));
			makhoahoc = baihoc.getMakhoahoc();
			model.addAttribute("editbaihoc", baihoc);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "create_lesson";
	}

	@RequestMapping(value = "/post-lesson", method = RequestMethod.POST)
	public String CreateLesson(ModelMap model, @RequestParam("namelesson") String name,
			@RequestParam("tghoanthanh") String tghoanthanh, @RequestParam("daura") String muctieu,
			@RequestParam("textarea") String content) {
		BaiHoc bh = null;
		try {
			if (mode == 0) {
				bh = new BaiHoc(0, name, Double.parseDouble(tghoanthanh), content, Double.parseDouble(muctieu), null,
						makhoahoc);
				bhD.ThemBaiHoc(bh);
			} else {
				bh = new BaiHoc(baihoc.getMabaihoc(), name, Double.parseDouble(tghoanthanh), content,
						Double.parseDouble(muctieu), null, makhoahoc);
				bhD.CapNhatBaiHoc(bh);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/courses?makhoahoc=" + makhoahoc;
	}

	@RequestMapping(value = "/remove-lesson", method = RequestMethod.GET)
	public String RemoveLesson(ModelMap model, @RequestParam("mabaihoc") String mabaihoc) {
		try {
			baihoc = bhD.FindOfMyALesson(Integer.parseInt(mabaihoc));
			bhD.XoaBaiHoc(baihoc.getMabaihoc());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "redirect:courses?makhoahoc=" + baihoc.getMakhoahoc();
	}
}
