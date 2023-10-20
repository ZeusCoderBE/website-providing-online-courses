package vn.iotstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	@RequestMapping(value={"/test","/trangchu"})
	public String index()
	{
<<<<<<< HEAD:ProjectCuoiKiWeb/src/main/java/vn/iotstar/Test.java
		return "";
=======
		return "DangKy";
>>>>>>> 54463c1ba80401c925cb9a123a3c306d7e1c4f59:ProjectCuoiKiWeb/src/main/java/vn/iotstar/LoginController.java
	}
	
}
