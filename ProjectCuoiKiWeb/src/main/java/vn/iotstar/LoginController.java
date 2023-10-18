package vn.iotstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@RequestMapping("/")
	public String index()
	{
<<<<<<< HEAD
		return "SignIn";
=======
		return "index";
>>>>>>> 010eddb3d6918022371de374b1d7b8c89b991f8b
	}
}
