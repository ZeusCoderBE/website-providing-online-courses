package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignUpController {
	@RequestMapping(value="/introduction/dang-ky", method=RequestMethod.GET)
	public String LogIn()
	{
		return "/introduction/DangKy";
	}
		
}