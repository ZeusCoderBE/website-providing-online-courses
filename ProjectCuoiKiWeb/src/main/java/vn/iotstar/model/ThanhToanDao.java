package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import vn.iotstar.database.DataBaseConnection;

public class ThanhToanDao {
	DataBaseConnection dbconn = new DataBaseConnection();

	public void thanhToan(ThanhToan tt, The the) throws ClassNotFoundException, SQLException {
		int check;
		// Thanh toán khóa học
		String sqlStr = String.format("INSERT INTO THANHTOAN VALUES(%d, %d, GETDATE(), %f,'%s')", tt.getMaNguoiDung(),
				tt.getMaKhoaHoc(), tt.getTienthanhtoan(), tt.getNdThanhToan());
		check = dbconn.ExecuteCommand(sqlStr);
		if (check == 0) {
			throw new SQLException("Thanh toán thất bại");
		}
		// Trừ tiền thẻ tài khoản
		sqlStr = String.format("UPDATE THE SET SoDu=%f WHERE MaThe='%s'", (the.getSoDu() - tt.getTienthanhtoan()),
				the.getMaThe());
		check = dbconn.ExecuteCommand(sqlStr);
		if (check == 0) {
			throw new SQLException("Cập nhật số dư thẻ gặp lỗi");
		}
	}

	public boolean isEnoughMoney(ThanhToan tt, The the) {
		if (the.getSoDu() < tt.getTienthanhtoan()) {
			return false;
		}
		return true;
	}
}
