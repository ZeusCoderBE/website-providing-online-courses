package vn.iotstar.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Servlet implementation class UpdateStudentServlet
 */

@Controller
public class UpdateStudentServlet extends HttpServlet {
	private StudentDAO std = new StudentDAO();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@RequestMapping(value="/UpdateStudentServlet", method=RequestMethod.GET)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int findMssv = Integer.parseInt(request.getParameter("mssv"));
		String errorString = "";
		Student findStd = null;
		try {
			findStd = std.findStudent(findMssv);
			System.out.println(findStd.getName());
		}
		catch(Exception ex) {
			errorString = ex.getMessage();
			ex.printStackTrace();
		}
		request.setAttribute("findStudent", findStd);
		request.setAttribute("errorString", errorString);
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/update.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@RequestMapping(value="/UpdateStudentServlet", method=RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Student st = new Student();
		// Cập nhật giá trị update sinh viên
		st.setMssv(Integer.valueOf(request.getParameter("mssv")));
		st.setName(request.getParameter("fullname"));
		st.setDiachi(request.getParameter("diachi"));
		HttpSession session = request.getSession(false);
		StudentDAO std = new StudentDAO();
		try {
			std.updateStudent(st);
			session.setAttribute("messageResp", "Cập nhật thành công!");
		} 
		catch (SQLException e) {
			session.setAttribute("messageResp", "Cập nhật thất bại!");
			e.printStackTrace();
		}
		response.sendRedirect("/006_JSP/ListStudentServlet");
	}

}
