package vn.iotstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

import vn.iotstar.model.GioHang;
import vn.iotstar.model.GioHangDao;

@Controller
public class CartController {

	GioHangDao ghD = new GioHangDao();

	@RequestMapping(value = "/ShowInforCart", method = RequestMethod.GET, params = "Id")
	public String MyCart(@RequestParam("Id") int manguoidung,ModelMap model) {
		try {
			List<GioHang> dsgiohang = new ArrayList<GioHang>();
			dsgiohang=ghD.GetMyCart(manguoidung);
			model.addAttribute("dsgiohang",dsgiohang);
			

		} catch (Exception ex) {
			System.out.print(ex);
		}
		return "cart";
	}
}
