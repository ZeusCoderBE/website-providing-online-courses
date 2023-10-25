package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vn.iotstar.model.*;

@Controller
public class SignInController {
	NguoiDungDao ndd = new NguoiDungDao();
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String DangNhap()
	{
		return "SignIn";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String SubmitDangNhap(ModelMap model, @RequestParam("Email") String email, @RequestParam("Password") String password)
	{
		boolean check = ndd.checkDangNhap(email, password);
		if (check == false) {
			return "SignIn";
		}
		return "redirect:/homepage";
	}
	@RequestMapping(value="forgetpassword", method=RequestMethod.GET)
	public String ForgetPassword()
	{
		return "forget_password";
	}
	@RequestMapping(value="getpassword", method=RequestMethod.POST)
	public String GetForgetPassword(ModelMap model, @RequestParam("Email") String email, @RequestParam("NewPassword") String newpass,  @RequestParam("CheckPassword") String checkpass)
	{
		int check = ndd.getForgetPass(email, newpass, checkpass);
		if (check == 1) {
			return "redirect:/login";
		}
		else if (check == 0) {
			model.addAttribute("warning", "Tài khoản hoặc mật khẩu không khớp! Vui lòng nhập lại");
		}
		return "forget_password";
	}
}
