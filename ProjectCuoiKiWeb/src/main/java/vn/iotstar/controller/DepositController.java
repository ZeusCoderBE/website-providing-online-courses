package vn.iotstar.controller;

import vn.iotstar.model.*;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class DepositController {
	TheDao tDao = new TheDao();

	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public String ShowDeposit(ModelMap model, HttpSession session) throws ClassNotFoundException, SQLException {
		TheDao td = new TheDao();
		HocVien hv = (HocVien) session.getAttribute("hocvien");
		The the = td.getAThe(hv.getManguoidung());
		model.addAttribute("hocvien", hv);
		model.addAttribute("the", the);
		return "deposit";
	}

	@RequestMapping(value = "/deposit", method = RequestMethod.POST)
	public String Deposit(ModelMap model, HttpSession session, 
			@RequestParam("price") String price,
			@RequestParam("card") String card	) throws ClassNotFoundException, SQLException 
	{
		if (tDao.UpdateThe(card, Double.parseDouble(price)) == 1) {
			session.setAttribute("thongbaotien", "Bạn đã cập nhật ví thành công !");
			return "redirect:/myprofiles";
		}
		else {
			session.setAttribute("thongbaotienloi", "Bạn đã cập nhật tiền thất bại !");
			return "deposit";
		}
	}
	
}
