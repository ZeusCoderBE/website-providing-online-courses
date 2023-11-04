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
	HocVienDao hvD = new HocVienDao();
	KhoaHocDao khD = new KhoaHocDao();
	TheDao tD = new TheDao();
	GiangVienDao gvD = new GiangVienDao();
	NguoiDungDao ndD = new NguoiDungDao();

	@RequestMapping(value = "myprofiles", method = RequestMethod.GET)
	public String ShowProfile(HttpSession session, ModelMap model) throws ClassNotFoundException, SQLException {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		HocVien hocvien = new HocVien();
		GiangVien giangvien = new GiangVien();
		if (hv != null) {
			hocvien = hvD.TimThongTinDN(hv.getEmail());
		}
		if (gv != null) {
			giangvien = gvD.TimThongTinDN(gv.getEmail());
		}
		if (gv == null && hocvien.getEmail() != null) {
			The the = tD.getAThe(hv.getManguoidung());
			model.addAttribute("thongtin", hocvien);
			model.addAttribute("the", the);
		} else if (gv == null && hocvien.getEmail() == null) {
			The the = tD.getAThe(hv.getManguoidung());
			hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
			model.addAttribute("the", the);
			model.addAttribute("thongtin", hocvien);
		} else if (hv == null && giangvien.getEmail() != null) {
			The the = tD.getAThe(gv.getManguoidung());
			model.addAttribute("thongtin", giangvien);
			model.addAttribute("the", the);
		} else if (hv == null && giangvien.getEmail() == null) {
			The the = tD.getAThe(gv.getManguoidung());
			model.addAttribute("thongtin", giangvien);
			model.addAttribute("the", the);
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
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		GiangVien giangvien = new GiangVien();
		String url = "";
		if (hv != null) {
			hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
			if (password.equals("null") || newpass.equals("null") || repass.equals("null")) {
				session.setAttribute("thongtinsai",
						"Bạn Vui Lòng Nhập Theo Hướng Dẫn ở dưới nếu bạn muốn đổi mật khẩu");
				url = "redirect:/myprofiles";
			} else if (hocvien.getMatkhau().equals(newpass)) {
				session.setAttribute("thongtinsai",
						"Mật Khẩu này bạn đã dùng cho lần cập nhật trước rồi ! Vui Lòng Sử dụng mật khẩu khác");
				url = "redirect:/myprofiles";
			} else if (!hocvien.getMatkhau().equals(password)) {
				session.setAttribute("thongtinsai", "Bạn Nhập Mật Khẩu Cũ Chưa Đúng");
				url = "redirect:/myprofiles";
			} else if (!newpass.equals(repass)) {
				session.setAttribute("thongtinsai", "Bạn Nhập Xác Nhận Mật Khẩu Chưa Đúng");
				url = "redirect:/myprofiles";
			} else if (ndD.UpdateMatKhau(newpass,hocvien.getManguoidung()) == 1) {
				RealoadKhoaHoc(model);
				url = "SignIn";
			}

		} else if (gv != null) {
			giangvien=gvD.TimThongTinDN_id(gv.getManguoidung());
			if (password.equals("null") || newpass.equals("null") || repass.equals("null")) {
				session.setAttribute("thongtinsai",
						"Bạn Vui Lòng Nhập Theo Hướng Dẫn ở dưới nếu bạn muốn đổi mật khẩu");
				url = "redirect:/myprofiles";
			} else if (giangvien.getMatkhau().equals(newpass)) {
				session.setAttribute("thongtinsai",
						"Mật Khẩu này bạn đã dùng cho lần cập nhật trước rồi ! Vui Lòng Sử dụng mật khẩu khác");
				url = "redirect:/myprofiles";
			} else if (!giangvien.getMatkhau().equals(password)) {
				session.setAttribute("thongtinsai", "Bạn Nhập Mật Khẩu Cũ Chưa Đúng");
				url = "redirect:/myprofiles";
			} else if (!newpass.equals(repass)) {
				session.setAttribute("thongtinsai", "Bạn Nhập Xác Nhận Mật Khẩu Chưa Đúng");
				url = "redirect:/myprofiles";
			} else if (ndD.UpdateMatKhau(newpass,giangvien.getManguoidung()) == 1) {
				RealoadKhoaHoc(model);
				System.out.print("Hello QuangHuy");
				url = "SignIn";
			}
		}
		else

		{
			session.setAttribute("thongtinsai", "Quá Trình Cập Nhật Thất Bại");
			url = "redirect:/myprofiles";
		}

		return url;
	}

	@RequestMapping(value = "myprofile", method = RequestMethod.POST)
	public String ChangeProfie(ModelMap model, HttpSession session, @RequestParam("username") String username,
			@RequestParam("quocgia") String quocgia, @RequestParam("sdt") String sdt,
			@RequestParam("trinhdo") String trinhdo, @RequestParam("diachi") String diachi,
			@RequestParam("vungmien") String vungmien, @RequestParam("email") String email,
			@RequestParam(value = "chuyennganh", required = false, defaultValue = "null") String chuyennganh)
			throws ClassNotFoundException, SQLException {
		String url = "";
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		int magiangvien = 0;
		int mahocvien = 0;
		if (gv != null && hv == null) {
			magiangvien = gv.getManguoidung();
		} else if (hv != null && gv == null) {
			mahocvien = hv.getManguoidung();
		}
		HocVien hocvien = new HocVien(mahocvien, username, email, sdt, quocgia, vungmien, diachi, trinhdo, "", "");
		GiangVien giangvien = new GiangVien(magiangvien, username, email, sdt, quocgia, vungmien, diachi, trinhdo, "",
				chuyennganh);
		try {
			if (hv != null && hvD.UpdateHocVien(hocvien) == 1) {
				session.setAttribute("thongbaothanhcong", "Bạn đã thay đổi thông tin thành công");
				url = "redirect:/homepages";
			} else if (gv != null && gvD.UpdateGiangVien(giangvien) == 1 && gvD.UpdateChuyenNganhGV(giangvien) == 1) {
				session.setAttribute("thongbaothanhcong", "Bạn đã thay đổi thông tin thành công");
				url = "redirect:/homepages";
			} else {
				url = "redirect:/myprofiles";
				throw new SQLException("Quá Trình Cập Nhật Bị Thất Bại Số Điện Thoại Đã tồn tại");
			}
		} catch (SQLException e) {
			session.setAttribute("thongbao", e.getMessage());
		}
		return url;
	}
}
