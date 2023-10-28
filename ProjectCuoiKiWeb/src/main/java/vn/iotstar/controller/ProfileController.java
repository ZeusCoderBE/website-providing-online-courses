package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.iotstar.model.KhoaHocDao;
import vn.iotstar.model.NguoiDungDao;

@Controller
public class ProfileController {

	@RequestMapping(value="/myprofiles", method=RequestMethod.GET)
	public String DangNhap()
	{
		return "profile";
	}
}

