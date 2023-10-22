package vn.iotstar.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.database.DatabaseConnection;
import vn.iotstar.model.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class InsertStudent
 */
@WebServlet("/InsertStudent")
public class InsertStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/register.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("fullname");
		StudentDAO std = new StudentDAO();
		int mssv = Integer.valueOf(request.getParameter("mssv"));
		String diachi = request.getParameter("diachi");
		
		Student st = new Student(mssv, name, diachi);
		HttpSession session = request.getSession();
		try {
			std.insertStudent(st);
			
			// Set the annoucement for response
			session.setAttribute("messageResp", "Đăng ký thành công!");
			
		} catch (SQLException ex) {
			session.setAttribute("messageResp", "Đăng ký thất bại!");
			ex.printStackTrace();
		}
		
		response.sendRedirect("/006_JSP/ListStudentServlet");
	}

}
