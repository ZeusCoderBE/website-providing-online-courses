package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	@RequestMapping(value="myprofiles",method = RequestMethod.GET)
	public String ShowProfile(HttpSession session,ModelMap model)
	{
		 return "profile";
	}
}

