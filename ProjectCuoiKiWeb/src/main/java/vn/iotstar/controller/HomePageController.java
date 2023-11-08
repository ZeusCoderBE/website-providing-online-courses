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
	NguoiDungDao ndD=new NguoiDungDao();
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String intro() {
		return "introduction";
	}

	@RequestMapping(value = "/homepages", method = RequestMethod.GET)
	public String homePage(ModelMap model,HttpSession session) throws Exception {
		List<KhoaHoc> ListKH = null;
		HocVien hv=(HocVien)session.getAttribute("hocvien");
		try {
			if(hv==null)
			{
				ListKH = khD.GetListCourses();
				model.addAttribute("danhsachkh", ListKH);
				throw new Exception("Bạn đang vào trang web này với vai trò là khách nếu bạn muốn đăng ký khóa học vui lòng tạo tài khoản !");
			}
			ListKH = khD.GetListCourses();
			model.addAttribute("danhsachkh", ListKH);
			List<GioHang> dsgiohang=new ArrayList<GioHang>();
			dsgiohang=ghD.GetTopMyCart(hv.getManguoidung());
			GioHang gh=ghD.CountCourse(hv.getManguoidung());
			HocVien hocvien = ndD.TimThongTinDN_Id(hv.getManguoidung());
			model.addAttribute("thongtin", hocvien);
			model.addAttribute("countkhoahoc",gh);
			model.addAttribute("dsgiohang", dsgiohang);
			

		} catch (Exception ex) {
			model.addAttribute("thongbaokhach",ex.getMessage());
		}

		return "homepage";
	}
	@RequestMapping(value="/myhomepage",method=RequestMethod.GET)
	public String FindMyLearning(HttpSession session,ModelMap model)
	{
		HocVien hv=(HocVien)session.getAttribute("hocvien");
		List<KhoaHoc> dskhoahoccuatoi=new ArrayList<KhoaHoc>();
		try		
		{
			dskhoahoccuatoi = khD.FindMyLearning(hv.getManguoidung());
			model.addAttribute("danhsachkhoahoc", dskhoahoccuatoi);
			model.addAttribute("check",0);
			List<GioHang> dsgiohang=new ArrayList<GioHang>();
			dsgiohang=ghD.GetTopMyCart(hv.getManguoidung());
			GioHang gh=ghD.CountCourse(hv.getManguoidung());
			model.addAttribute("countkhoahoc",gh);
			model.addAttribute("dsgiohang", dsgiohang);
			
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
			List<GioHang> dsgiohang = new ArrayList<GioHang>();
			dsgiohang = ghD.GetMyCart(hv.getManguoidung());
			GioHang gh=ghD.CountCourse(hv.getManguoidung());
			model.addAttribute("countkhoahoc",gh);
			model.addAttribute("dsgiohang", dsgiohang);
			model.addAttribute("isdangky", khD.khoahocDangKy(hv.getManguoidung(), khoahoc.getMakhoahoc()));

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return "describe";
	}
}
