package vn.iotstar.model;

import java.util.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class BaiHocDao {

	DataBaseConnection dbC = new DataBaseConnection();

	public List<BaiHoc> GetScience(BaiHoc baihoc) throws SQLException, ClassNotFoundException {
		ResultSet rs = dbC.ExecuteQuery("exec sp_XemDanhSachKH " + baihoc.getMabaihoc() + "");
		List<BaiHoc> listbaihoc = new ArrayList<BaiHoc>();
		while (rs.next() == true) {
			baihoc = new BaiHoc(rs.getInt("MaBaiHoc"), rs.getNString("TenBaiHoc"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("NoiDungBaiHoc"), rs.getNString("MucTieuDauRa"), rs.getDate("NgayDang"),
					rs.getInt("MaKhoaHoc"));
			 listbaihoc.add(baihoc);
		}
		return listbaihoc;
	}

}
