package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import vn.iotstar.database.DataBaseConnection;

public class KhoaHocDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public List<KhoaHoc> GetListCourses() throws ClassNotFoundException, SQLException {
		String query = "select *From KhoaHoc";
		ResultSet rs = dbC.ExecuteQuery(query);
		List<KhoaHoc> danhsachkh = new ArrayList<KhoaHoc>();
		KhoaHoc khoahoc = new KhoaHoc();
		while (rs.next() == true) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),
					rs.getInt("DanhGia"));
			danhsachkh.add(khoahoc);
		}
		return danhsachkh;
	}

	public KhoaHoc FindCourseOfCustomer(KhoaHoc khoahoc) throws ClassNotFoundException, SQLException {
		String query = "select *From KhoaHoc where MaKhoaHoc=" + khoahoc.getMakhoahoc() + "";
		ResultSet rs = dbC.ExecuteQuery(query);
		if (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),
					rs.getInt("DanhGia"));

		}
		System.out.print(query);
		return khoahoc;
	}
	public List<KhoaHoc> FindMyLearning(int manguoidung) throws ClassNotFoundException, SQLException
	{
		String thucthi="sp_XemKhoaHocCuaToi "+manguoidung+"";
		ResultSet rs= dbC.ExecuteQuery(thucthi);
		KhoaHoc khoahoc=new KhoaHoc();
		List<KhoaHoc> listkh=new ArrayList<KhoaHoc>();
		while(rs.next())
		{
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"),rs.getNString("TenKhoaHoc"),rs.getNString("TrinhDoDauVao"),rs.getNString("MoTa"));
			listkh.add(khoahoc);
		}
		return listkh;
	}

	public KhoaHoc getACourse(int makhoahoc) throws ClassNotFoundException, SQLException {
		String sqlStr = String.format("SELECT * FROM KHOAHOC WHERE MaKhoaHoc=%d", makhoahoc);
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		KhoaHoc khoahoc = null;
		if (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),
					rs.getInt("DanhGia"));
		}

		return khoahoc;
	}
}
