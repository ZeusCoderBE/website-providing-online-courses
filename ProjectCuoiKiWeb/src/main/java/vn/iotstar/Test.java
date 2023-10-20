package vn.iotstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	@RequestMapping(value={"/test","/trangchu"})
	public String index()
	{
		return "DangKy";
	}
	
}
