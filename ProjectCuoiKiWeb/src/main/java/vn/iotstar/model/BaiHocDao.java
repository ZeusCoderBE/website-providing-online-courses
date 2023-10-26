package vn.iotstar.model;

import java.util.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class BaiHocDao {

	DataBaseConnection dbC = new DataBaseConnection();

	public List<BaiHoc> GetScience(KhoaHoc khoahoc) throws SQLException, ClassNotFoundException {
		
		  ResultSet rs = dbC.ExecuteQuery("sp_XemDanhSachBaiHoc "+khoahoc.getMakhoahoc()+"");
		  List<BaiHoc> listbaihoc = new ArrayList<BaiHoc>(); 
		  BaiHoc baihoc = new BaiHoc();
		  
		  while (rs.next()) 
		  { 
			  baihoc = new BaiHoc(rs.getInt("MaBaiHoc"), rs.getNString("TenBaiHoc"), rs.getDouble("ThoiGianHoanThanh"),
					  rs.getString("NoiDungBaiHoc"), rs.getDouble("MucTieuDauRa"), rs.getDate("NgayDang"), rs.getInt("MaKhoaHoc"));
			  listbaihoc.add(baihoc); 
		  }

		  return listbaihoc;
		 
	}

}
