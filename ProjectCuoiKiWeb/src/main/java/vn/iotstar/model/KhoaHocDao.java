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
		KhoaHoc khoahoc = new KhoaHoc();
		List<KhoaHoc> danhsachkh=new ArrayList<KhoaHoc>();
		while (rs.next() == true) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),rs.getInt("DanhGia"));
			danhsachkh.add(khoahoc);
		}
		return danhsachkh;
	}

}
