package vn.iotstar.model;

import jakarta.servlet.http.HttpSession;
import vn.iotstar.database.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

public class StudentDAO {
	public StudentDAO() {
		
	}
	// Lấy danh sách sinh viên
	public List<Student> getListStudent() throws SQLException {
		ResultSet rs = null;
		Connection conn = null;
		List<Student> listStudent = new ArrayList<Student>();
		try {
			conn = DatabaseConnection.initialiseDatabase();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM student");
			
			//Show data
			while (rs.next()) {
				Student st = new Student(rs.getInt(1), rs.getString(2), rs.getString(3));
				listStudent.add(st);
			}
		}
		catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return listStudent;
	}
	// Thêm sinh viên mới
	public void insertStudent(Student st) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseConnection.initialiseDatabase();
			PreparedStatement prepStmt = conn.prepareStatement("INSERT INTO student VALUES(?, ?, ?)");
			prepStmt.setInt(1, st.getMssv());
			prepStmt.setString(2, st.getName());
			prepStmt.setString(3, st.getDiachi());
			prepStmt.executeUpdate();
			
			// Close all connections
			prepStmt.close();
			conn.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	// Xóa sinh viên theo id và name
	public void deleteStudent(int mssv) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseConnection.initialiseDatabase();
			PreparedStatement prepStmt = conn.prepareStatement("DELETE FROM student WHERE id=?");
			prepStmt.setInt(1, mssv);
			prepStmt.executeUpdate();
			
			// Close all connections
			prepStmt.close();
			conn.close();
		} 
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void updateStudent(Student st) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseConnection.initialiseDatabase();
			PreparedStatement prepStmt = conn.prepareStatement("UPDATE student SET id=?, name=?, address=? WHERE id=?");
			prepStmt.setInt(1, st.getMssv());
			prepStmt.setString(2, st.getName());
			prepStmt.setString(3, st.getDiachi());
			prepStmt.setInt(4, st.getMssv());
			prepStmt.executeUpdate();
			
			// Close all connections
			prepStmt.close();
			conn.close();
		} 
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public Student findStudent(int findMssv) {
		Connection conn = null;
		ResultSet rs = null;
		Student st = new Student();
		try {
			conn = DatabaseConnection.initialiseDatabase();
			PreparedStatement prepStmt = conn.prepareStatement("SELECT * FROM student WHERE id=?");
			prepStmt.setInt(1, findMssv);
			rs = prepStmt.executeQuery();
			
			/*
			 * Close all connections prepStmt.close(); conn.close();
			 */
			while(rs.next()) {
				st = new Student(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
		} 
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return st;
	}
}
