package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignInController {
	int check=0;
	@RequestMapping(value="/dang-nhap",method=RequestMethod.GET)
	public String DangNhap()
	{
		String url="";
		if(check==0)
		{
			url="SignIn";
		}
		return url;
	}
}
