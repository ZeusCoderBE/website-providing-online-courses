package vn.iotstar.controller;
import vn.iotstar.model.*;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomePageController {
	KhoaHocDao khD=new KhoaHocDao();
	@RequestMapping(value="/introduction", method=RequestMethod.GET)
	public String intro()
	{
		return "introduction";
	}
	@RequestMapping(value="/homepage", method=RequestMethod.GET)
	public String homePage(ModelMap model)
	{
		List<KhoaHoc> ListKH=null;
		try
		{
			ListKH=khD.GetListCourses();
			model.addAttribute("danhsachkh",ListKH);
	
		}
		catch(Exception ex)
		{
			
		}

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
