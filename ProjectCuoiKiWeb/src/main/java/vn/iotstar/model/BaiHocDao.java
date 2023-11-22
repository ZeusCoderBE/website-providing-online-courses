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

	public List<BaiHoc> FindMaBaiHoc(int makhoahoc) throws ClassNotFoundException, SQLException {
		String dml = "select BAIHOC.MaBaiHoc From BAIHOC where MaKhoaHoc= " + makhoahoc + "";
		ResultSet rs = dbC.ExecuteQuery(dml);
		BaiHoc baihoc = new BaiHoc();
		List<BaiHoc> dsbaihoc = new ArrayList<BaiHoc>();
		while (rs.next()) {
			baihoc = new BaiHoc(rs.getInt("MaBaiHoc"));
			dsbaihoc.add(baihoc);
		}
		return dsbaihoc;
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
		String sqlStr = String.format(Locale.US, "INSERT INTO BAIHOC VALUES(N'%s', %f, N'%s', %f, GETDATE(), %d)",
				baihoc.getTenbaihoc(), baihoc.getThoigianhoanthanh(), baihoc.getNoidungbaihoc(),
				baihoc.getMuctieudaura(), baihoc.getMakhoahoc());
		System.out.print(sqlStr);
		int check = dbC.ExecuteCommand(sqlStr);
		if (check == 0) {
			throw new SQLException("Thêm bài học thất bại");
		}
	}

	public void XoaBaiHoc(int mabaihoc) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("DELETE FROM BAIHOC WHERE MaBaiHoc = %d", mabaihoc);
		dbC.ExecuteCommand(sqlStr);

	}

	public void CapNhatBaiHoc(BaiHoc bh) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format(Locale.US,
				"UPDATE BAIHOC SET TenBaiHoc=N'%s', ThoiGianHoanThanh=%f, NoiDungBaiHoc=N'%s', MucTieuDauRa=%f WHERE MaBaiHoc=%d",
				bh.getTenbaihoc(), bh.getThoigianhoanthanh(), bh.getNoidungbaihoc(), bh.getMuctieudaura(),
				bh.getMabaihoc());
		System.out.println(sqlStr);
		dbC.ExecuteCommand(sqlStr);
	}

	public void MaskAsDone(int mabaihoc, int manguoidung) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format(
				"UPDATE HOC SET TrangThai = 'Done',NgayHoanThanh=GETDATE() WHERE MaBaiHoc =%d and MaNguoiDung=%d",
				mabaihoc, manguoidung);
		dbC.ExecuteCommand(sqlStr);
	}

	public void InsertIntoHoc(int manguoidung, int mabaihoc) {
		String dml = "sp_InsertLessonIntoHoc " + manguoidung + "," + mabaihoc + " ";
		System.out.print(dml);
		dbC.ExecuteCommand(dml);
	}

	public BaiHoc FindStatus(int mabaihoc, int manguoidung) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("select TrangThai from HOC where MaBaiHoc = %d and MaNguoiDung=%d", mabaihoc,
				manguoidung);
		BaiHoc baihoc = new BaiHoc();
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		if (rs.next()) {
			baihoc = new BaiHoc(rs.getString("TrangThai"));
			return baihoc;
		}

		return null;
	}

}
