package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignInController {
	@RequestMapping(value="/dang-nhap",method=RequestMethod.GET)
	public String DangNhap()
	{
		return "SignIn";
	}
}
