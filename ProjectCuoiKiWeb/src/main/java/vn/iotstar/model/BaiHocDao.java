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
	public BaiHoc FindOfMyALesson(int mabaihoc) throws ClassNotFoundException, SQLException
	{
		String dml="Select *From v_xemdanhsachtailieu where MaBaiHoc="+mabaihoc+"";
		BaiHoc baihoc=new BaiHoc();
		ResultSet rs=dbC.ExecuteQuery(dml);
		if(rs.next()==true)
		{
			baihoc=new BaiHoc(rs.getInt("MaBaiHoc"), rs.getNString("TenBaiHoc"), rs.getNString("NoiDungBaiHoc"), rs.getDate("NgayDang"), rs.getInt("MaKhoaHoc"), rs.getNString("DuongDanLuuTru"));
			return baihoc;
		}
		else
		{
			return null;
		}
	}

	public int ThemBaiHoc(BaiHoc baihoc) throws SQLException, ClassNotFoundException {
		System.out.println("ThemBaiHoc "+baihoc.getMakhoahoc());
		String sqlStr = String.format("INSERT INTO BAIHOC VALUES(%d, N'%s', %f, N'%s', %f, GETDATE(), NULL, %d)",
				baihoc.getMabaihoc(), baihoc.getTenbaihoc(), baihoc.getThoigianhoanthanh(), baihoc.getNoidungbaihoc(),
				baihoc.getMuctieudaura(), baihoc.getMakhoahoc());
		int check = dbC.ExecuteCommand(sqlStr);
		return check;
	}
}
