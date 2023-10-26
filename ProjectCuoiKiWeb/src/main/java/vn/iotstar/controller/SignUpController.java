package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import vn.iotstar.model.*;

@Controller
public class SignUpController {
	NguoiDungDao ndD = new NguoiDungDao();
	HocVienDao hvD = new HocVienDao();
	GiangVienDao gvD = new GiangVienDao();

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public String SignIn() {
		return "DangKy";
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST, params = "tkhocvien")
	public String XuLiSignUpHocVien(Model map, @RequestParam("username") String username,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("confirmpassword") String confipass, @RequestParam("quocgia") String quocgia,
			@RequestParam(value = "tkhocvien", required = false, defaultValue = "null") String tkhocvien) {
		String url = "";
		if ("null".equals(tkhocvien)) {
			map.addAttribute("thongbaoloi", "Bạn Chưa Chọn Loại Tài Khoản !");
		} else if (!password.equals(confipass)) {
			map.addAttribute("xacnhanmksai", "Xác Nhận Mật Khẩu Không Đúng !");
		} else {
			HocVien hv = new HocVien(username, email, quocgia, password);
			int themnd = ndD.SignUp(hv);
			if (themnd == 1) {
				hvD.InsertHocVien();
				map.addAttribute("thongbaodung", "Bạn Đã Đăng Ký Thành Công !");
				url = "SignIn";
			} else {
				map.addAttribute("thongbaodksai", "Thất Bại !");
				url = "DangKy";
			}
		}
		return url;
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST, params = "tkgiaovien")
	public String XuLiSignUpGiaoVien(Model map, @RequestParam("username") String username,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("confirmpassword") String confipass, @RequestParam("quocgia") String quocgia,
			@RequestParam(value = "tkgiaovien", required = false, defaultValue = "null") String tkgiaovien) {
		System.out.print("vogiaovien");
		if ("null".equals(tkgiaovien)) {
			map.addAttribute("thongbaoloi", "Bạn Chưa Chọn Loại Tài Khoản !");
		} else if (!password.equals(confipass)) {
			map.addAttribute("xacnhanmksai", "Xác Nhận Mật Khẩu Không Đúng !");
		} else {
			GiangVien gv = new GiangVien(username, email, quocgia, password);
			int ketqua = ndD.SignUp(gv);
			if (ketqua == 1) {
				gvD.InsertGiangVien();
				map.addAttribute("thongbaodkdung", "Chúc Mừng Bạn Đã Đăng Kí Thành Công !");
			} else {
				map.addAttribute("thongbaodksai", "Thất Bại !");
			}
		}
		return "DangKy";
	}

}
