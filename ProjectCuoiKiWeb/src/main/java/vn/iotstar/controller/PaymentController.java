package vn.iotstar.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.exception.*;
import vn.iotstar.model.*;

@Controller
public class PaymentController {
	private KhoaHoc khoahoc;
	private The the;
	private List<KhoaHoc> dsKhoahoc;

	@RequestMapping(value = "/paycourse", method = RequestMethod.GET, params = "makhoahoc")
	public String payment(ModelMap model, HttpSession session, @RequestParam("makhoahoc") String makh) {
		KhoaHocDao khd = new KhoaHocDao();
		ThanhToanDao ttd = new ThanhToanDao();
		TheDao td = new TheDao();
		dsKhoahoc = new ArrayList<KhoaHoc>();
		HocVien hv = (HocVien) session.getAttribute("hocvien");

		try {
			// Lấy tên khóa học
			// khoahoc = khd.FindCourseOfCustomer(new KhoaHoc(Integer.parseInt(makh)));
			dsKhoahoc.add(khd.FindCourseOfCustomer(new KhoaHoc(Integer.parseInt(makh))));
			the = td.getAThe(hv.getManguoidung());
			model.addAttribute("dskhoahoc", ttd.DanhSachTenKH(dsKhoahoc));
			model.addAttribute("tonggiatien", ttd.SumCostOfCourse(dsKhoahoc));
			model.addAttribute("the", the);
			model.addAttribute("noidungtt", ttd.NoiDungThanhToan(dsKhoahoc));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.print(e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "pay";
	}

	@RequestMapping(value = "paid", method = RequestMethod.POST)
	public String payCourse(ModelMap model, HttpSession session, @RequestParam("noidungtt") String noidungtt)
			throws Exception {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		ThanhToanDao ttd = new ThanhToanDao();
		KhoaHoc khoahoc = dsKhoahoc.get(0);
		
		try {
			ThanhToan tt = new ThanhToan(hv.getManguoidung(), khoahoc.getMakhoahoc(), khoahoc.getGiatien(), noidungtt);
			if (!ttd.isEnoughMoney(tt, the)) {
				throw new OutOfMoney("Không đủ tiền để thanh toán");
			}
			ttd.thanhToan(tt, the);
			model.addAttribute("warning", "Thanh toán thành công!");
			return "redirect:/describe?makhoahoc=" + khoahoc.getMakhoahoc();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		} catch (OutOfMoney e) {
			// TODO Auto-generated catch block
			model.addAttribute("warning", e.getMessage());
		}
		return "redirect:/paycourse?makhoahoc=" + khoahoc.getMakhoahoc();
	}
}
