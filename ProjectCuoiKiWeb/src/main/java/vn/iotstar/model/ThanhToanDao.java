package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import vn.iotstar.database.DataBaseConnection;

public class ThanhToanDao {
	DataBaseConnection dbconn = new DataBaseConnection();

	public void thanhToan(ThanhToan tt, The the) throws ClassNotFoundException, SQLException {
		int check;
		// Thanh toán khóa học
		String sqlStr = String.format(Locale.US,"INSERT INTO THANHTOAN VALUES(%d, %d, GETDATE(), %f,'%s')", tt.getMaNguoiDung(),
				tt.getMaKhoaHoc(), tt.getTienthanhtoan(), tt.getNdThanhToan());
		System.out.print(sqlStr);
		check = dbconn.ExecuteCommand(sqlStr);
		if (check == 0) {
			throw new SQLException("Thanh toán thất bại");
		}
		// Trừ tiền thẻ tài khoản
		sqlStr = String.format(Locale.US,"UPDATE THE SET SoDu=%f WHERE MaThe='%s'", (the.getSoDu() - tt.getTienthanhtoan()),
				the.getMaThe());
		check = dbconn.ExecuteCommand(sqlStr);
		if (check == 0) {
			throw new SQLException("Cập nhật số dư thẻ gặp lỗi");
		}
		System.out.print("Da Vao DAy");
	}

	public String DanhSachTenKH(List<KhoaHoc> dskhoahoc) {
		String tenkh = "";
		for (KhoaHoc kh : dskhoahoc) {
			tenkh += kh.getTenkhoahoc() + " " + "<br>";
		}
		return tenkh;
	}

	public String NoiDungThanhToan(List<KhoaHoc> dskhoahoc) {
		String ndthanhtoan = "";
		for (KhoaHoc kh : dskhoahoc) {
			ndthanhtoan += "Thanh Toán " + kh.getTenkhoahoc() + " " + "<br>";
		}
		return ndthanhtoan;
	}

	public double SumCostOfCourse(List<KhoaHoc> dskhoahoc) throws ClassNotFoundException, SQLException {
		double sumCost = 0;
		for (KhoaHoc kh : dskhoahoc) {
			sumCost += kh.getGiatien();
		}
		return sumCost;
	}

	public boolean isEnoughMoney(ThanhToan tt, The the) {
		if (the.getSoDu() < tt.getTienthanhtoan()) {
			return false;
		}
		return true;
	}
}
