package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaymentController {
	@RequestMapping(value="paycourse", method=RequestMethod.GET)
	public String payment() {
		return "payment";
	}
	@RequestMapping(value="paycourse", method=RequestMethod.POST)
	public String payCourse(ModelMap model, @RequestParam("mahocvien") String mahocvien, @RequestParam("makhoahoc") String makhoahoc) {
		return "payment";
	}
}
