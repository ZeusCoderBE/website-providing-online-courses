package vn.iotstar.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.iotstar.information.Company;
import vn.iotstar.model.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SignInController {
	HocVienDao hvD = new HocVienDao();
	KhoaHocDao khD = new KhoaHocDao();
	NguoiDungDao ndd = new NguoiDungDao();
	GiangVienDao gvD = new GiangVienDao();
	@Autowired
	@Qualifier("coursera")
	Company company;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String DangNhap(HttpSession session) {
		session.setAttribute("company", company);
		System.out.print(company);
		System.out.print(company.getName());
		return "SignIn";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, params = "tkhocvien")
	public String DangNhapHV(ModelMap model, HttpServletRequest rq, @RequestParam("Email") String email,
			@RequestParam("Password") String password,
			@RequestParam(value = "tkhocvien", required = false, defaultValue = "null") String tkhocvien)
			throws ClassNotFoundException, SQLException {
		HttpSession session = rq.getSession();
		HocVien hv = new HocVien();
		boolean check = hvD.checkDangNhapHV(email, password);
		if (check == false) {
			model.addAttribute("loidangnhap", "Bạn Nhập Tài Khoản Hoặc Mật Khẩu Chưa Đúng");
			return "SignIn";
		} else {
			hv = hvD.TimThongTinDN(email);
			session.setAttribute("hocvien", hv);
			return "redirect:/homepages";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, params = "tkgiaovien")
	public String DangNhapGV(ModelMap model, HttpServletRequest rq, @RequestParam("Email") String email,
			@RequestParam("Password") String password,
			@RequestParam(value = "tkgiangvien", required = false, defaultValue = "null") String tkhocvien)
			throws ClassNotFoundException, SQLException {
		try {
			HttpSession session = rq.getSession();
			GiangVien gv = new GiangVien();
			boolean check = gvD.CheckDNGiangVien(email, password);
			if (check == false) {
				model.addAttribute("loidangnhap", "Bạn Nhập Tài Khoản Hoặc Mật Khẩu Chưa Đúng");
				return "SignIn";
			} else {
				gv = gvD.TimThongTinDN(email);
				session.setAttribute("giangvien", gv);
			}
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		return "redirect:/homepages";
	}

	@RequestMapping(value = "dang-xuat", method = RequestMethod.GET)
	public String DangXuat(HttpServletRequest rq) {
		HttpSession session = rq.getSession();
		session.invalidate();
		return "introduction";
	}

	@RequestMapping(value = "forgetpassword", method = RequestMethod.GET)
	public String ForgetPassword() {
		return "forget_password";
	}

	@RequestMapping(value = "getpassword", method = RequestMethod.POST)
	public String GetForgetPassword(HttpSession session, ModelMap model, @RequestParam("Email") String email,
			@RequestParam("NewPassword") String newpass, @RequestParam("CheckPassword") String checkpass) {

		int check = ndd.getForgetPass(email, newpass, checkpass);
		if (check == 1) {
			session.setAttribute("thongbaodoipass", "Bạn Đã Đổi Mật Khẩu Thành Công");
			return "redirect:/login";
		} else if (check == 0) {
			model.addAttribute("warning", "Bạn nhập xác nhận mật khẩu chưa đúng !");
		}
		return "forget_password";
	}
}
