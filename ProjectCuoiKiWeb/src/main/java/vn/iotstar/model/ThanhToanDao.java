package vn.iotstar.model;

import java.util.*;
//import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import vn.iotstar.*;
import vn.iotstar.database.DataBaseConnection;
import vn.iotstar.model.*;

public class ThanhToanDao {
	DataBaseConnection dbconn = new DataBaseConnection();

	public void thanhToan(ThanhToan tt, The the) throws ClassNotFoundException, SQLException {
		// Thanh toán khóa học
		String sqlStr = String.format("INSERT INTO THANHTOAN VALUES(%d, %d, GETDATE(), %f,'%s')", tt.getMaNguoiDung(),
				tt.getMaKhoaHoc(), tt.getTienthanhtoan(), tt.getNdThanhToan());
		dbconn.ExecuteCommand(sqlStr);
		
		// Trừ tiền thẻ tài khoản
		sqlStr = String.format("UPDATE THE SET SoDu=%f WHERE MaThe='%s'", (the.getSoDu()-tt.getTienthanhtoan()), the.getMaThe());
		dbconn.ExecuteCommand(sqlStr);
	}

}
