package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import java.sql.SQLException;
import java.util.*;

import vn.iotstar.model.GioHang;
import vn.iotstar.model.GioHangDao;
import vn.iotstar.model.HocVien;

@Controller
public class CartController {

	GioHangDao ghD = new GioHangDao();

	@RequestMapping(value = "/ShowInforCart", method = RequestMethod.GET, params = "Id")
	public String MyCart(@RequestParam("Id") int manguoidung, ModelMap model) {
		try {
			List<GioHang> dsgiohang = new ArrayList<GioHang>();
			dsgiohang = ghD.GetMyCart(manguoidung);
			model.addAttribute("dsgiohang", dsgiohang);

		} catch (Exception ex) {

		}
		return "cart";
	}

	@RequestMapping(value = "AddCourse", method = RequestMethod.GET, params = "makhoahoc")
	public String AddCourseIntoCart(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc) {
		String url = "";
		try {
			HocVien hv = (HocVien) session.getAttribute("hocvien");
			GioHang giohang = new GioHang(hv.getManguoidung(), makhoahoc);
			if (ghD.InsertCourseCart(giohang) == 0) {
				url = "cart";
				List<GioHang> dsgiohang = new ArrayList<GioHang>();
				dsgiohang = ghD.GetMyCart(hv.getManguoidung());
				model.addAttribute("dsgiohang", dsgiohang);
				throw new Exception("Khóa học này đã có trong giỏ hàng của bạn rồi");
			} else {
				session.setAttribute("thongbaothemtc", "Bạn đã thêm thành công vui lòng vào giỏ hàng để xem");
				url = "redirect:/homepages";
			}
		} catch (Exception ex) {
			model.addAttribute("thongbaothemgiohang", ex.getMessage());
		}
		return url;
	}

	@RequestMapping(value="DeleteCourse",method=RequestMethod.GET,params={"makhoahoc","id"})
	public String DeleteCourseIntoCart(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc
			,@RequestParam("id") int manguoidung)
	{
		String url = "";
		try {
			GioHang giohang = new GioHang(manguoidung, makhoahoc);
			if (ghD.DeleteCourseCart(giohang) == 0) {
				url = "cart";
				List<GioHang> dsgiohang = new ArrayList<GioHang>();
				dsgiohang = ghD.GetMyCart(manguoidung);
				model.addAttribute("dsgiohang", dsgiohang);
				model.addAttribute("thongbaoxoa", "Bạn đã xóa thất bại");
			} else {
				session.setAttribute("thongbaoxoa", "Bạn đã xóa thành công vui lòng vào giỏ hàng để xem");
				url = "redirect:/homepages";
			}
		} catch (Exception ex) {
			
		}
		return url;
	}
	@RequestMapping(value="DeleteCourses",method=RequestMethod.GET,params={"makhoahoc","id"})
	public String DeleteCoursesIntoCart(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc
			,@RequestParam("id") int manguoidung) throws ClassNotFoundException, SQLException
	{
		List<GioHang> dsgiohang = new ArrayList<GioHang>();
		try {
			GioHang giohang = new GioHang(manguoidung, makhoahoc);
			if (ghD.DeleteCourseCart(giohang) == 1) {
				dsgiohang = ghD.GetMyCart(manguoidung);
				model.addAttribute("dsgiohang", dsgiohang);
				model.addAttribute("thongbaoxoa", "Bạn đã xóa thành công ");
				
			} else {
				dsgiohang = ghD.GetMyCart(manguoidung);
				model.addAttribute("dsgiohang", dsgiohang);
				model.addAttribute("thongbaoxoa", "Bạn đã xóa thất bại");
			}
		} catch (Exception ex) {
		}
		return "cart";
	}
}
