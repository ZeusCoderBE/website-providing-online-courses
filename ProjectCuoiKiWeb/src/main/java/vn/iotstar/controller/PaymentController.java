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
	private GioHangDao ghd = new GioHangDao();
	GiangVienDao gvD = new GiangVienDao();
	GioHangDao ghD = new GioHangDao();
	BaiHocDao bhD = new BaiHocDao();

	@RequestMapping(value = "/paycourseinfo", method = RequestMethod.GET)
	public String payCourseInfo(ModelMap model,
			@RequestParam(value = "selectedCourses", required = false) List<String> selectedCourses,
			HttpSession session,
			@RequestParam(value = "makhoahoc", required = false, defaultValue = "null") String makh) {
		HocVienDao hvD = new HocVienDao();
		KhoaHocDao khd = new KhoaHocDao();
		ThanhToanDao ttd = new ThanhToanDao();
		TheDao td = new TheDao();
		dsKhoahoc = new ArrayList<KhoaHoc>();
		String url = "";
		try {
			HocVien hv = (HocVien) session.getAttribute("hocvien");
			List<GioHang> dsgiohang = new ArrayList<GioHang>();
			dsgiohang = ghd.GetTopMyCart(hv.getManguoidung());
			GioHang gh = ghd.CountCourse(hv.getManguoidung());
			HocVien hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
			the = td.getAThe(hv.getManguoidung());
			if (selectedCourses == null && makh.equals("null")) {
				url = "cart";
				model.addAttribute("thongbaott",
						"Không có gì trong giỏ hàng để thanh toán hoặc bạn chưa chọn khoá học cần để thanh toán");
			} else if (makh.equals("null") && selectedCourses != null && !selectedCourses.isEmpty()) {
				dsKhoahoc = khd.CountSelectedCourses(selectedCourses);
				url = "pay";
			} else {
				dsKhoahoc.add(khd.FindCourseOfCustomer(new KhoaHoc(Integer.parseInt(makh))));
				url = "pay";
			}
			model.addAttribute("dskhoahoc", ttd.DanhSachTenKH(dsKhoahoc));
			model.addAttribute("tonggiatien", ttd.SumCostOfCourse(dsKhoahoc));
			model.addAttribute("the", the);
			model.addAttribute("noidungtt", ttd.NoiDungThanhToan(dsKhoahoc));
			model.addAttribute("thongtin", hocvien);
			model.addAttribute("countkhoahoc", gh);
			model.addAttribute("dsgiohang", dsgiohang);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.print(e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception ex) {

		}
		return url;
	}

	@RequestMapping(value = "paycourses", method = RequestMethod.POST)
	public String payCart(ModelMap model, HttpSession session, @RequestParam("noidungtt") String noidungtt) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		ThanhToanDao ttd = new ThanhToanDao();
		BaiHoc baihoc = new BaiHoc();
		try {
			double totalCost = ttd.SumCostOfCourse(dsKhoahoc);
			if (totalCost > the.getSoDu()) {
				throw new OutOfMoney("Không đủ tiền để thanh toán");
			}
			for (KhoaHoc kh : dsKhoahoc) {
				System.out.print("1");
				ThanhToan tt = new ThanhToan(hv.getManguoidung(), kh.getMakhoahoc(), kh.getGiatien(),
						String.format("Thanh toán %s", kh.getTenkhoahoc()));
				ttd.thanhToan(tt, the);
				
				KhoaHoc khoahoc = new KhoaHoc(kh.getMatacgia(), kh.getGiatien());
				gvD.UpdateofCardTeacher(khoahoc);
				
				baihoc = bhD.FindMaBaiHoc(kh.getMakhoahoc());
				
				if (baihoc != null) {
					bhD.InsertIntoHoc(hv.getManguoidung(), baihoc.getMakhoahoc());
				}
			}
			ghd.DeleteCoursesIntoCart(dsKhoahoc, hv.getManguoidung());
			System.out.print("Di Ngang Qua Day");
			session.setAttribute("warning", "Thanh toán thành công!");
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
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		return "pay";
	}
}
