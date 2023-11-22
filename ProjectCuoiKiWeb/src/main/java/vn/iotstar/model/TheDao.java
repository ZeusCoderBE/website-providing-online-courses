package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Locale;

import vn.iotstar.database.DataBaseConnection;

public class TheDao {
	DataBaseConnection dbconn = new DataBaseConnection();
	
	public The getAThe(int mand) throws ClassNotFoundException, SQLException {
		String sqlStr = String.format("SELECT * FROM THE WHERE MaNguoiDung=%d", mand);
		ResultSet rs = dbconn.ExecuteQuery(sqlStr);
		The the = null;
		if (rs.next()) {
			the = new The(rs.getString(1), rs.getFloat(2), rs.getInt(3));
		}
		return the;
	}
	
	public int UpdateThe(String mathe, double sotien) {
		String sqlStr = String.format(Locale.US,"sp_UpdateThe '%s', %f", mathe, sotien);
		int ketqua = dbconn.ExecuteCommand(sqlStr);
		return ketqua;
	}
}
