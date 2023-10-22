package vn.iotstar.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.*;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ListStudentServlet {
       
    @RequestMapping(value="/ListStudentServlet", method=RequestMethod.GET)
	protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt;
		List<Student> listStudent = new ArrayList<Student>();
		StudentDAO std = new StudentDAO();
		try {
			listStudent = std.getListStudent();
			
			request.setAttribute("listStudent", listStudent);
			System.out.format("Lay danh sach thanh cong %d", listStudent.get(0).getMssv());
		} 
		catch (SQLException ex) {
			ex.printStackTrace();
		} 
		
		return "page02";
	}
}
