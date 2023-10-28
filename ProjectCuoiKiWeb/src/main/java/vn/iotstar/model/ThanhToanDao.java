package vn.iotstar.model;

import java.util.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import vn.iotstar.*;
import vn.iotstar.database.DataBaseConnection;

public class ThanhToanDao {
	DataBaseConnection dbconn = new DataBaseConnection();

	public void thanhToan(ThanhToan tt) throws ClassNotFoundException, SQLException {
		String sqlStr = String.format("INSERT INTO THANHTOAN VALUES(%d, %d, GETDATE(), %f,NULL,NULL,NULL)", tt.getMaNguoiDung(),
				tt.getMaKhoaHoc(), tt.getTienThanhToan());
		System.out.print(sqlStr);
		dbconn.ExecuteCommand(sqlStr);
	}

	public HashMap<Integer, Float> kiemTraThanhToan(float tienThanhToan, int maKhoaHoc) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		HashMap<Integer, Float> res = new HashMap<Integer, Float>();
		conn = dbconn.initializeDatabase();
		CallableStatement cstmt = conn.prepareCall("{call sp_thanhtoanKH(?, ? ,?, ?)}");
		// Setting the value for the TN parameter
		cstmt.setFloat(1, tienThanhToan);
		cstmt.setInt(2, maKhoaHoc);
		// Registering the type of the OUT parameters
		cstmt.registerOutParameter(3, Types.INTEGER);
		cstmt.registerOutParameter(4, Types.FLOAT);
		cstmt.execute();

		System.out.println(cstmt.getInt(3) + " " + cstmt.getFloat(4));
		res.put(cstmt.getInt(3), cstmt.getFloat(4));

		return res;
	}
}
