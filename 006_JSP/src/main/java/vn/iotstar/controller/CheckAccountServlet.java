package vn.iotstar.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.Account;
import vn.iotstar.model.AccountDAO;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Servlet implementation class CheckAccountServlet
 */

@Controller
public class CheckAccountServlet {
	private AccountDAO adao = new AccountDAO(); 
    @RequestMapping(value="/CheckAccountServlet", method=RequestMethod.POST)
	protected String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account acc = new Account(request.getParameter("username"), request.getParameter("password"));
		boolean checkAcc = false;
		try {
			checkAcc = adao.checkAccount(acc);
			if (checkAcc) {
				System.out.println("Dang nhap thanh cong");
				return "redirect:/ListStudentServlet";
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Sai tai khoan hoac mat khau");
		return "login";
	}
}
