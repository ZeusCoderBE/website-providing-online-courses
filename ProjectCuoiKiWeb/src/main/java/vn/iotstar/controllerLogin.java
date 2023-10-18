package vn.iotstar;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import jakarta.servlet.http.HttpServletRequest;
@Controller
public class controllerLogin {
	@RequestMapping(value="/dang-nhap",method=RequestMethod.POST)
	public String login(HttpServletRequest rq)
	{
		String username=rq.getParameter("username");
		String password =rq.getParameter("password");
		if(username.equals("quanghuy") && password.equals("123"))
		{
			return "index";
		}
		else
		{
			rq.setAttribute("thongbaoloi", "Sai Username hoặc password");
			return "DangNhap";
		}
	}
}
