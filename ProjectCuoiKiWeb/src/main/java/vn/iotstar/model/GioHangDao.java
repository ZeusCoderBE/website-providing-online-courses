package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import vn.iotstar.database.DataBaseConnection;

public class GioHangDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public List<GioHang>GetMyCart(int manguoidung) throws ClassNotFoundException, SQLException
	{
		GioHang giohang =new GioHang();
		String query="select *From v_XemGioHang where MaNguoiDung="+manguoidung+"";
		List<GioHang>dsgiohang=new ArrayList<GioHang>();
		ResultSet rs=dbC.ExecuteQuery(query);
		while(rs.next())
		{
			giohang=new GioHang(rs.getNString("HoTen"), rs.getString("Email"),
					rs.getNString("TenKhoaHoc"),rs.getInt("DanhGia"), rs.getInt("MaTacGia"),
					rs.getNString("TrinhDoDauVao"),rs.getDouble("GiaTien"),rs.getDouble("ThoiGianHoanThanh"),rs.getNString("LinhVuc"));
			dsgiohang.add(giohang);
		}
		return dsgiohang;
	}
	public List<GioHang>GetTopMyCart(int manguoidung) throws ClassNotFoundException, SQLException
	{
		GioHang giohang =new GioHang();
		String query="select Top 3 * From v_XemGioHang="+manguoidung+"";
		List<GioHang>dsgiohang=new ArrayList<GioHang>();
		ResultSet rs=dbC.ExecuteQuery(query);
		while(rs.next())
		{
			giohang=new GioHang(rs.getNString("HoTen"), rs.getString("Email"),
					rs.getNString("TenKhoaHoc"),rs.getInt("DanhGia"), rs.getInt("MaTacGia"),
					rs.getNString("TrinhDoDauVao"),rs.getDouble("GiaTien"),rs.getDouble("ThoiGianHoanThanh"),rs.getNString("LinhVuc"));
			dsgiohang.add(giohang);
		}
		return dsgiohang;
	}
}
