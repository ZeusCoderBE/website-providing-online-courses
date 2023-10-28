package vn.iotstar.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.*;

@Controller
public class PaymentController {
	private int makhoahoc;
	private The the;

	@RequestMapping(value = "paycourse", method = RequestMethod.GET, params = "makhoahoc")
	public String payment(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makh) 
	{
		KhoaHocDao khd = new KhoaHocDao();
		TheDao td = new TheDao();
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		KhoaHoc khoahoc =new KhoaHoc(makh);
		makhoahoc=makh;
		try {
			// Lấy tên khóa học
			khoahoc = khd. FindCourseOfCustomer(khoahoc);
			the = td.getAThe(hv.getManguoidung());
			model.addAttribute("khoahoc", khoahoc);
			model.addAttribute("the", the);
			model.addAttribute("noidungtt", String.format("THANH TOAN KHOA HOC %s", khoahoc.getTenkhoahoc().toUpperCase()));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.print(e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "payment";
	}

	@RequestMapping(value = "paid", method = RequestMethod.POST)
	public String payCourse(ModelMap model, HttpSession session, @RequestParam("bill") String thanhtoan,
			@RequestParam("noidungtt") String noidungtt) 
	{
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		ThanhToan tt = new ThanhToan(hv.getManguoidung(), makhoahoc, Float.parseFloat(thanhtoan), noidungtt);

		ThanhToanDao ttd = new ThanhToanDao();
		try {
			ttd.thanhToan(tt, the);
			model.addAttribute("warning", "Thanh toán thành công!");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}

		return "payment";
	}
}
