package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.sql.SQLException;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	NguoiDungDao ndD = new NguoiDungDao();
	HocVienDao hvD = new HocVienDao();
	KhoaHocDao khD = new KhoaHocDao();
	@RequestMapping(value = "myprofiles", method = RequestMethod.GET)
	public String ShowProfile(HttpSession session, ModelMap model) throws ClassNotFoundException, SQLException {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		HocVien hocvien = new HocVien();
		if (!hocvien.getEmail().equals(null)) {
			hocvien = ndD.TimThongTinDN(hv.getEmail());
			model.addAttribute("thongtin", hocvien);
		}
		else {
			hocvien = ndD.TimThongTinDN_Id(hv.getManguoidung());
			model.addAttribute("thongtin", hocvien);
		}
		return "profile";
	}
	
	public void RealoadKhoaHoc(ModelMap model) throws ClassNotFoundException, SQLException {
		List<KhoaHoc> ListKH = null;
		ListKH = khD.GetListCourses();
		model.addAttribute("danhsachkh", ListKH);
	}

	@RequestMapping(value = "changepass", method = RequestMethod.POST)
	public String ChangePassWord(ModelMap model, HttpSession session,
			@RequestParam(value = "password", required = false, defaultValue = "null") String password,
			@RequestParam(value = "newpass", required = false, defaultValue = "null") String newpass,
			@RequestParam(value = "repass", required = false, defaultValue = "null") String repass)
			throws ClassNotFoundException, SQLException {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		HocVien hocvien = new HocVien();
		hocvien = ndD.TimThongTinDN(hv.getEmail());
		HocVien hovVien = new HocVien(newpass, hocvien.getManguoidung());
		String url = "";
		if (password.equals("null") || newpass.equals("null") || repass.equals("null")) {
			session.setAttribute("thongtinsai", "Bạn Vui Lòng Nhập Theo Hướng Dẫn ở dưới nếu bạn muốn đổi mật khẩu");
			url = "redirect:/myprofiles";
		}
		else if(hocvien.getMatkhau().equals(newpass))
		{
			session.setAttribute("thongtinsai", "Mật Khẩu này bạn đã dùng cho lần cập nhật trước rồi ! Vui Lòng Sử dụng mật khẩu khác");
			url = "redirect:/myprofiles";
		}
		else if (!hocvien.getMatkhau().equals(password)) {
			session.setAttribute("thongtinsai", "Bạn Nhập Mật Khẩu Cũ Chưa Đúng");
			url = "redirect:/myprofiles";
		} else if (!newpass.equals(repass)) {
			session.setAttribute("thongtinsai", "Bạn Nhập Xác Nhận Mật Khẩu Chưa Đúng");
			url = "redirect:/myprofiles";
		} else if (hvD.UpdateMatKhauHocVien(hovVien) == 1) {
			RealoadKhoaHoc(model);
			url = "SignIn";
		} else {
			session.setAttribute("thongtinsai", "Quá Trình Cập Nhật Thất Bại");
			url = "redirect:/myprofiles";
		}

		return url;
	}

	@RequestMapping(value = "myprofile", method = RequestMethod.POST)
	public String ChangeProfie(ModelMap model, HttpSession session, @RequestParam("username") String username,
			@RequestParam("quocgia") String quocgia, @RequestParam("sdt") String sdt,
			@RequestParam("trinhdo") String trinhdo, @RequestParam("diachi") String diachi,
			@RequestParam("vungmien") String vungmien,
			@RequestParam("email") String email) throws ClassNotFoundException, SQLException

	{
		String url = "";
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		HocVien hocvien = new HocVien(hv.getManguoidung(), username, email, sdt, quocgia, vungmien, diachi, trinhdo, "",
				"");
		email = hocvien.getEmail();
		if (hvD.UpdateHocVien(hocvien) == 1) {
			RealoadKhoaHoc(model);
			model.addAttribute("thongtin", hocvien);
			session.setAttribute("thongbaothanhcong","Bạn đã thay đổi thông tin thành công");
			url = "redirect:/homepages";
		} else {
			url = "redirect:/myprofiles";
			session.setAttribute("thongbao", "Quá Trình Cập Nhật Bị Thất Bại Số Điện Thoại Đã tồn tại");
		}
		return url;
	}
}
