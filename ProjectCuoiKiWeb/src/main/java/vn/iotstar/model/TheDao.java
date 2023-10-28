package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class TheDao {
	DataBaseConnection dbconn = new DataBaseConnection();
	
	public The getAThe(int mand) throws ClassNotFoundException, SQLException {
		String sqlStr = String.format("SELECT * FROM THE WHERE MaNguoiDung=%d", mand);
		ResultSet rs = dbconn.ExecuteQuery(sqlStr);
		The the = null;
		if (rs.next()) {
			the = new The(rs.getString("MaThe"), rs.getFloat(2), rs.getInt(3));
		}
		
		return the;
	}
}
