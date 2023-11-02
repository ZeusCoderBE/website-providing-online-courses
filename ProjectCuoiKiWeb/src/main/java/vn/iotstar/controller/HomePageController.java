package vn.iotstar.controller;

import vn.iotstar.model.*;

import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomePageController {
	KhoaHocDao khD = new KhoaHocDao();
	BaiHocDao bhD = new BaiHocDao();
	GioHangDao ghD=new GioHangDao();
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String intro() {
		return "introduction";
	}

	@RequestMapping(value = "/homepages", method = RequestMethod.GET)
	public String homePage(ModelMap model,HttpSession session) {
		List<KhoaHoc> ListKH = null;
		HocVien hv=(HocVien)session.getAttribute("hocvien");
		try {
			ListKH = khD.GetListCourses();
			model.addAttribute("danhsachkh", ListKH);
			List<GioHang> dsgiohang=new ArrayList<GioHang>();
			dsgiohang=ghD.GetTopMyCart(hv.getManguoidung());
			model.addAttribute("dsgiohang", dsgiohang);
			System.out.print(dsgiohang.get(0).getKhoahoc().getTenkhoahoc());
			

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return "homepage";
	}
	@RequestMapping(value="/myhomepage",method=RequestMethod.GET)
	public String FindMyLearning(HttpSession session,Model map)
	{
		HocVien hv=(HocVien)session.getAttribute("hocvien");
		List<KhoaHoc> dskhoahoccuatoi=new ArrayList<KhoaHoc>();
		try		
		{
			dskhoahoccuatoi = khD.FindMyLearning(hv.getManguoidung());
			map.addAttribute("danhsachkhoahoc", dskhoahoccuatoi);
			map.addAttribute("check",0);
			
		}
		catch(Exception ex)
		{
			
		}
		return "homepage";
	}
	@RequestMapping(value = "/describe", method = RequestMethod.GET, params = "makhoahoc")
	public String XemMotKhoaHoc(ModelMap model, HttpSession session,@RequestParam("makhoahoc") int makhoahoc) {
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		KhoaHoc khoahoc = new KhoaHoc(makhoahoc);
		List<BaiHoc> ListBH = new ArrayList<BaiHoc>();
		try {
			khoahoc = khD.FindCourseOfCustomer(khoahoc);
			model.addAttribute("khoahoc", khoahoc);
			ListBH = bhD.GetScience(khoahoc);
			model.addAttribute("listbaihoc", ListBH);
			model.addAttribute("isdangky", khD.khoahocDangKy(hv.getManguoidung(), khoahoc.getMakhoahoc()));

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return "describe";
	}
}
