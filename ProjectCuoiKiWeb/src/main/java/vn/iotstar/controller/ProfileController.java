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
		List<KhoaHoc> certificate = new ArrayList<>();
		if (hv != null && gv == null) {
			hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
			certificate = hvD.FindCertificateHV(hocvien.getManguoidung());
			The the = tD.getAThe(hv.getManguoidung());
			model.addAttribute("certificate", certificate);
			model.addAttribute("thongtin", hocvien);
			model.addAttribute("the", the);
		} else if (gv != null && hv == null) {
			giangvien = gvD.TimThongTinDN_id(gv.getManguoidung());
			The the = tD.getAThe(giangvien.getManguoidung());
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
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "newpass", required = false) String newpass)
			throws ClassNotFoundException, SQLException {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		HocVien hocvien = new HocVien();
		GiangVien gv = (GiangVien) session.getAttribute("giangvien");
		GiangVien giangvien = new GiangVien();
		String url = "";
		String meSession = "";
		if (hv != null) {
			hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
			if (!hocvien.getMatkhau().equals(password)) {
				meSession = "Bạn Nhập Mật Khẩu Cũ Chưa Đúng";
				url = "redirect:/myprofiles";
			} else if (hocvien.getMatkhau().equals(newpass)) {
				meSession = "Mật Khẩu này bạn đã dùng cho lần cập nhật trước rồi ! Vui Lòng Sử dụng mật khẩu khác";
				url = "redirect:/myprofiles";
			} else if (ndD.UpdateMatKhau(newpass, hocvien.getManguoidung()) == 1) {
				RealoadKhoaHoc(model);
				url = "SignIn";
			} else {
				meSession = "Quá Trình Cập Nhật Thất Bại";
				url = "redirect:/myprofiles";
			}

		} else if (gv != null) {
			giangvien = gvD.TimThongTinDN_id(gv.getManguoidung());
			if (!giangvien.getMatkhau().equals(password)) {
				meSession = "Bạn Nhập Mật Khẩu Cũ Chưa Đúng";
				url = "redirect:/myprofiles";
			} else if (giangvien.getMatkhau().equals(newpass)) {
				meSession = "Mật Khẩu này bạn đã dùng cho lần cập nhật trước rồi ! Vui Lòng Sử dụng mật khẩu khác";
				url = "redirect:/myprofiles";
			} else if (ndD.UpdateMatKhau(newpass, giangvien.getManguoidung()) == 1) {
				RealoadKhoaHoc(model);
				meSession = "Bạn đã đổi mật khẩu thành công";
				url = "SignIn";
			} else {
				meSession = "Quá Trình Cập Nhật Thất Bại";
				url = "redirect:/myprofiles";
			}
		}
		session.setAttribute("thongtinsai", meSession);
		return url;
	}

	@RequestMapping(value = "myprofiles", method = RequestMethod.POST)
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
				session.setAttribute("thongbao", "Quá Trình Cập Nhật Thất Bại !");
			}
		} catch (Exception e) {

		}
		return url;
	}

	@RequestMapping(value = "certificate", method = RequestMethod.GET)
	public String PrintCertificate(ModelMap model, HttpSession session, @RequestParam("makhoahoc") int makhoahoc)
			throws SQLException, ClassNotFoundException {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		HocVien hocvien = new HocVien();
		KhoaHoc namekh = khD.FindTenKhoaHoc(makhoahoc);
		hocvien = hvD.TimThongTinDN_Id(hv.getManguoidung());
		model.addAttribute("khoahoc", namekh);
		model.addAttribute("tenhocvien", hocvien);
		return "certificate";
	}
}
