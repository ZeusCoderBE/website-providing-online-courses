package vn.iotstar.model;

import java.sql.*;
import java.sql.SQLException;
import java.util.*;

import vn.iotstar.database.DataBaseConnection;

public class GioHangDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public List<GioHang> GetMyCart(int manguoidung) throws ClassNotFoundException, SQLException {
		GioHang giohang = new GioHang();
		String query = "select *From v_XemGioHang where MaNguoiDung=" + manguoidung + "";
		List<GioHang> dsgiohang = new ArrayList<GioHang>();
		ResultSet rs = dbC.ExecuteQuery(query);
		while (rs.next()) {
			giohang = new GioHang(rs.getNString("HoTen"), rs.getString("Email"), rs.getNString("TenKhoaHoc"),
					rs.getInt("DanhGia"), rs.getInt("MaTacGia"), rs.getNString("TrinhDoDauVao"),
					rs.getDouble("GiaTien"), rs.getDouble("ThoiGianHoanThanh"), rs.getNString("LinhVuc"),
					rs.getDate("NgayPhatHanh"), rs.getInt("MaKhoaHoc"), rs.getNString("MinhHoa"));
			dsgiohang.add(giohang);
		}
		return dsgiohang;
	}
	public GioHang CountCourse(int manguoidung) throws ClassNotFoundException, SQLException {
		GioHang giohang = new GioHang();
		String query = "select Count(*) as Num From v_XemGioHang where MaNguoiDung=" + manguoidung + "";
		ResultSet rs = dbC.ExecuteQuery(query);
		if (rs.next()) {
			giohang = new GioHang(rs.getInt("Num"));
			return giohang;
		} else {
			return null;
		}
	}

	public double SumCostOfCourse(List<GioHang> dsgiohang) throws ClassNotFoundException, SQLException {
		double sumCost = 0;
		for (GioHang gh : dsgiohang) {
			sumCost += gh.getKhoahoc().getGiatien();
		}
		return sumCost;
	}

	public void DeleteCoursesIntoCart(List<KhoaHoc> dskhoahoc, int manguoidung) {
		GioHang gh = new GioHang();
		for (KhoaHoc ds : dskhoahoc) {
			gh = new GioHang(manguoidung, ds.getMakhoahoc());
			DeleteCourseCart(gh);
		}
	}

	public List<GioHang> GetTopMyCart(int manguoidung) throws ClassNotFoundException, SQLException {
		GioHang giohang = new GioHang();
		String query = "select Top 3 * From v_XemGioHang where MaNguoiDung=" + manguoidung + "";
		List<GioHang> dsgiohang = new ArrayList<GioHang>();
		ResultSet rs = dbC.ExecuteQuery(query);
		while (rs.next()) {
			giohang = new GioHang(rs.getNString("HoTen"), rs.getString("Email"), rs.getNString("TenKhoaHoc"),
					rs.getInt("DanhGia"), rs.getInt("MaTacGia"), rs.getNString("TrinhDoDauVao"),
					rs.getDouble("GiaTien"), rs.getDouble("ThoiGianHoanThanh"), rs.getNString("LinhVuc"),
					rs.getDate("NgayPhatHanh"), rs.getInt("MaKhoaHoc"), rs.getNString("MinhHoa"));
			dsgiohang.add(giohang);
		}
		return dsgiohang;
	}

	public List<KhoaHoc> GetCourseList(List<GioHang> dsgiohang) {
		List<KhoaHoc> dskhoahoc = new ArrayList<KhoaHoc>();
		for (GioHang gh : dsgiohang) {
			dskhoahoc.add(gh.getKhoahoc());
		}
		return dskhoahoc;
	}

	public int InsertCourseCart(GioHang gh) {
		String dml = "exec sp_InsertCourseCart " + gh.getHocvien().getManguoidung() + ","
				+ gh.getKhoahoc().getMakhoahoc() + "";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int DeleteCourseCart(GioHang gh) {
		String dml = "exec sp_DeleteCourseCart " + gh.getHocvien().getManguoidung() + ", "
				+ gh.getKhoahoc().getMakhoahoc() + "";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}
}
