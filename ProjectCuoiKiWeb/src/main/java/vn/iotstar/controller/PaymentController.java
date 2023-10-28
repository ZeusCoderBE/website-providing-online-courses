package vn.iotstar.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.*;

@Controller
public class PaymentController {
	private int makhoahoc;
	KhoaHocDao khD=new KhoaHocDao();
	@RequestMapping(value="paycourse", method=RequestMethod.GET, params = "makhoahoc")
	public String payment(@RequestParam("makhoahoc") String makh) {
		makhoahoc = Integer.parseInt(makh);
		return "payment";
	}
	@RequestMapping(value="paid", method=RequestMethod.POST)
	public String payCourse(ModelMap model, HttpServletRequest request, @RequestParam("bill") String thanhtoan) {
		HttpSession session = request.getSession(false);
		HocVien hv = (HocVien)session.getAttribute("hocvien");
		ThanhToan tt = new ThanhToan(hv.getManguoidung(), makhoahoc, Float.parseFloat(thanhtoan));	
		ThanhToanDao ttd = new ThanhToanDao();
		HashMap<Integer, Float> check;
		List<KhoaHoc> dskhoahoccuatoi =null;
		try {
			check = ttd.kiemTraThanhToan(Float.parseFloat(thanhtoan), makhoahoc);
			if (check.containsKey(2)){
				ttd.thanhToan(tt);
				model.addAttribute("warning", "Thanh toán thành công!");
				dskhoahoccuatoi = khD.FindMyLearning(hv.getManguoidung());
				session.setAttribute("danhsachkhoahoc", dskhoahoccuatoi);
				session.setAttribute("kiemtra", 1);
			}
			else if (check.containsKey(1)){
				model.addAttribute("warning", String.format("Thanh toán thất bại! tiền thanh toán thiếu:$%f", check.get(1)));
			}
			else {
				model.addAttribute("warning", String.format("Thanh toán thất bại! tiền thanh toán dư:$%f", check.get(0)));
			}
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
