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
	private The the;
	private List<KhoaHoc> dsKhoahoc;
	private List<GioHang> dsgiohang;
	private GioHangDao ghd = new GioHangDao();

	@RequestMapping(value = "/paycourseinfo", method = RequestMethod.GET, params = "makhoahoc")
	public String payCourseInfo(ModelMap model, HttpSession session, @RequestParam("makhoahoc") String makh) {
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
	@RequestMapping(value = "/paycartinfo", method = RequestMethod.GET)
	public String payCartInfo(ModelMap model, HttpSession session) {
		dsgiohang = (List<GioHang>) session.getAttribute("dsgiohang");
		ThanhToanDao ttd = new ThanhToanDao();
		TheDao td = new TheDao();
		dsKhoahoc = ghd.GetCourseList(dsgiohang);
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		try {
			// Lấy tên khóa học
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

	@RequestMapping(value = "paycourses", method = RequestMethod.POST)
	public String payCart(ModelMap model, HttpSession session, @RequestParam("noidungtt") String noidungtt) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		//dsgiohang = (List<GioHang>) session.getAttribute("dsgiohang");
		ThanhToanDao ttd = new ThanhToanDao();
		//dsKhoahoc = ghd.GetCourseList(dsgiohang);

		try {
			double totalCost = ttd.SumCostOfCourse(dsKhoahoc);
			if (totalCost > the.getSoDu()) {
				throw new OutOfMoney("Không đủ tiền để thanh toán");
			}
			for (KhoaHoc kh : dsKhoahoc) {
				ThanhToan tt = new ThanhToan(hv.getManguoidung(), kh.getMakhoahoc(),
						kh.getGiatien(), String.format("Thanh toán %s", kh.getTenkhoahoc()));
				ttd.thanhToan(tt, the);
			}
			model.addAttribute("warning", "Thanh toán thành công!");
			return "redirect:/myhomepage";
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
		return "pay";
	}
}
