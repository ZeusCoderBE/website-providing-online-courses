package vn.iotstar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DatabaseConnection;

public class AccountDAO {
	public boolean checkAccount(Account acc) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseConnection.initialiseDatabase();
			stmt = conn.prepareStatement("SELECT * FROM TAIKHOAN WHERE UserName=? AND Passwords=?");
			stmt.setString(1, acc.getUserName());
			stmt.setString(2, acc.getPassWord());
			rs = stmt.executeQuery();
			
			if(rs.next() != false) {
				return true;
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			stmt.close();
			conn.close();
		}
		return false;
	}
}
