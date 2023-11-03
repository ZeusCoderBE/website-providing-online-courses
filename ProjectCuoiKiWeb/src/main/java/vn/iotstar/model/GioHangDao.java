package vn.iotstar.model;

import java.sql.ResultSet;
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
					rs.getDate("NgayPhatHanh"),rs.getInt("MaKhoaHoc"));
			dsgiohang.add(giohang);
		}
		return dsgiohang;
	}
	public GioHang CountCourse (int manguoidung) throws ClassNotFoundException, SQLException {
		GioHang giohang = new GioHang();
		String query = "select Count(*) as Num From v_XemGioHang where MaNguoiDung=" + manguoidung + "";
		ResultSet rs = dbC.ExecuteQuery(query);
		if (rs.next()) {
			giohang = new GioHang(rs.getInt("Num"));
			return giohang;
		}
		else
		{
			return null;
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
					rs.getDate("NgayPhatHanh"),rs.getInt("MaKhoaHoc"));
			dsgiohang.add(giohang);
		}
		return dsgiohang;
	}

	public int InsertCourseCart(GioHang gh) {
		String dml = "insert into GioHang(MaNguoiDung,MaKhoaHoc)\r\n" + "values(" + gh.getHocvien().getManguoidung()
				+ "," + gh.getKhoahoc().getMakhoahoc() + ")";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int DeleteCourseCart(GioHang gh)
	{
		String dml="delete From GioHang where MaNguoidung="+gh.getHocvien().getManguoidung()+
				" and MaKhoaHoc="+gh.getKhoahoc().getMakhoahoc()+"";
		int ketqua=dbC.ExecuteCommand(dml);
		System.out.print(dml);
		return ketqua;
	}
}
