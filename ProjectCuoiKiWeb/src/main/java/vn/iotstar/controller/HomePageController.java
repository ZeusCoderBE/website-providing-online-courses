package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomePageController {
	@RequestMapping(value="/introduction", method=RequestMethod.GET)
	public String intro()
	{
		return "introduction";
	}
	@RequestMapping(value="/homepage", method=RequestMethod.GET)
	public String homePage(ModelMap model)
	{
		// Lấy danh sách khóa học để hiển thị lên trang chủ

		return "homepage";
	}
	@RequestMapping(value="/homepage", method=RequestMethod.GET, params="makh")
	public String getKhoaHoc(ModelMap model)
	{
		// Lấy makh để truy cập tới khóa học đó trong trang course
		// Lấy danh sách bài học trong khóa học đó
		
		return "course";
	}
}
