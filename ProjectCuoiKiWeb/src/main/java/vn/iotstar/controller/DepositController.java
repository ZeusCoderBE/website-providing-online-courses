package vn.iotstar.controller;

import vn.iotstar.model.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class DepositController {
	TheDao tDao = new TheDao();
	GioHangDao ghD = new GioHangDao();
	HocVienDao hvD = new HocVienDao();

	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public String ShowCard(ModelMap model, HttpSession session) throws ClassNotFoundException, SQLException {
		TheDao td = new TheDao();
		try {
			HocVien hv = (HocVien) session.getAttribute("hocvien");
			HocVien hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
			The the = td.getAThe(hv.getManguoidung());
			List<GioHang> dsgiohang = new ArrayList<GioHang>();
			dsgiohang = ghD.GetTopMyCart(hv.getManguoidung());
			GioHang gh = ghD.CountCourse(hv.getManguoidung());
			model.addAttribute("thongtin", hocvien);
			model.addAttribute("countkhoahoc", gh);
			model.addAttribute("dsgiohang", dsgiohang);
			model.addAttribute("the", the);
		} catch (Exception ex) {

		}
		return "deposit";
	}

	@RequestMapping(value = "/deposit", method = RequestMethod.POST)
	public String Deposit(ModelMap model, HttpSession session, @RequestParam("price") String price,
			@RequestParam("card") String card) throws ClassNotFoundException, SQLException {
		try {
			if (tDao.UpdateThe(card, Double.parseDouble(price)) == 1) {
				session.setAttribute("thongbaotien", "Bạn đã cập nhật ví thành công !");
				return "redirect:/myprofiles";
			} else {
				model.addAttribute("thongbaotienloi", "Bạn đã cập nhật tiền thất bại !");
				return "deposit";
			}
		} catch (Exception ex) {
			model.addAttribute("thongbaotienloi", "Bạn đã cập nhật tiền thất bại !");
			return "deposit";
		}
	}

}
