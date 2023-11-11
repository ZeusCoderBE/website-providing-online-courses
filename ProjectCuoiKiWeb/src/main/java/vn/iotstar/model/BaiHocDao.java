package vn.iotstar.model;

import java.util.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class BaiHocDao {

	DataBaseConnection dbC = new DataBaseConnection();

	public List<BaiHoc> GetListLesson(KhoaHoc khoahoc) throws SQLException, ClassNotFoundException {
		String sql = "sp_XemDanhSachBaiHoc " + khoahoc.getMakhoahoc() + "";
		ResultSet rs = dbC.ExecuteQuery(sql);

		BaiHoc baihoc = new BaiHoc();
		List<BaiHoc> listbaihoc = new ArrayList<BaiHoc>();
		while (rs.next() == true) {
			baihoc = new BaiHoc(rs.getInt("MaBaiHoc"), rs.getNString("TenBaiHoc"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("NoiDungBaiHoc"), rs.getDouble("MucTieuDauRa"), rs.getDate("NgayDang"),
					rs.getInt("MaKhoaHoc"));
			listbaihoc.add(baihoc);
		}
		return listbaihoc;
	}

	public BaiHoc FindOfMyALesson(int mabaihoc) throws ClassNotFoundException, SQLException {
		String dml = "Select *From v_xemdanhsachtailieu where MaBaiHoc=" + mabaihoc + "";
		BaiHoc baihoc = new BaiHoc();
		ResultSet rs = dbC.ExecuteQuery(dml);
		if (rs.next() == true) {
			baihoc = new BaiHoc(rs.getInt("MaBaiHoc"), rs.getNString("TenBaiHoc"), rs.getNString("NoiDungBaiHoc"),
					rs.getDouble("MucTieuDauRa"), rs.getDate("NgayDang"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getInt("MaKhoaHoc"), rs.getNString("DuongDanLuuTru"));
			return baihoc;
		} else {
			return null;
		}
	}

	public void ThemBaiHoc(BaiHoc baihoc) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format(Locale.US,
			    "INSERT INTO BAIHOC VALUES(N'%s', %f, N'%s', %f, GETDATE(), NULL, %d)",
			    baihoc.getTenbaihoc(), baihoc.getThoigianhoanthanh(),
			    baihoc.getNoidungbaihoc(), baihoc.getMuctieudaura(), baihoc.getMakhoahoc());
		int check = dbC.ExecuteCommand(sqlStr);
		System.out.println(baihoc.getThoigianhoanthanh());
		if (check == 0) {
			throw new SQLException("Thêm bài học thất bại");
		}
	}

	public void XoaBaiHoc(int mabaihoc) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("DELETE FROM BAIHOC WHERE MaBaiHoc = %d", mabaihoc);
		int check = dbC.ExecuteCommand(sqlStr);
	}

	public void CapNhatBaiHoc(BaiHoc bh) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format(
				"UPDATE BAIHOC SET TenBaiHoc=N'%s', ThoiGianHoanThanh=%f, NoiDungBaiHoc=N'%s', MucTieuDauRa=%f WHERE MaBaiHoc=%d",
				bh.getTenbaihoc(), bh.getThoigianhoanthanh(), bh.getNoidungbaihoc(), bh.getMuctieudaura(),
				bh.getMabaihoc());
		int check = dbC.ExecuteCommand(sqlStr);
	}
}
