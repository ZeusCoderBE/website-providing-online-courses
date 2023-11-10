package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import vn.iotstar.database.DataBaseConnection;

public class HocVienDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int InsertHocVien() {
		String sql = "sp_TimTaiKhoanHocVien";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
	public HocVien TimThongTinDN_Id(int manguoidung) throws ClassNotFoundException, SQLException
	{
		String sql="SELECT * FROM vThongTinHocVien AS vtt"
				+ "\t WHERE vtt.MaHocVien = '" + manguoidung + "'";
		ResultSet rs=dbC.ExecuteQuery(sql);
		HocVien hv= new HocVien();
		while(rs.next())
		{
			hv=new HocVien(rs.getInt("MaHocVien"), rs.getNString("HoTen"),rs.getString("Email")
					,rs.getString("Sdt"),rs.getNString("QuocGia"),rs.getNString("VungMien"),
					rs.getNString("DiaChi"),rs.getNString("TrinhDo"),rs.getString("MatKhau"),rs.getNString("loaitaikhoan"));
		}
		return hv;
	}
	public HocVien TimThongTinDN(String email) throws ClassNotFoundException, SQLException
	{
		String sql="SELECT * FROM vThongTinHocVien AS vtt"
				+ "\t WHERE vtt.Email = '" + email + "'";
		ResultSet rs=dbC.ExecuteQuery(sql);
		HocVien hv= new HocVien();
		while(rs.next())
		{
			hv=new HocVien(rs.getInt("MaHocVien"), rs.getNString("HoTen"),rs.getString("Email")
					,rs.getString("Sdt"),rs.getNString("QuocGia"),rs.getNString("VungMien"),
					rs.getNString("DiaChi"),rs.getNString("TrinhDo"),rs.getString("MatKhau"),rs.getNString("loaitaikhoan"));
		}
		return hv;
	}
	public boolean checkDangNhapHV(String email, String password) {
		String sqlStr = "exec sp_CheckLoginHV ?,?,?";
		boolean check = false;
		List<Object> params = new ArrayList<>();
		params.add(email);
		params.add(password);
		params.add(0);
		try {
			Object result = dbC.ExecuteProcedure(sqlStr, params);
			double ketqua = (double) result;
			if (ketqua == 1) {
				check = true;
			}

		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return check;
	}

	public int UpdateHocVien(HocVien hv) {
		String sql = "Update NguoiDung set HoTen=N'" + hv.getHoten() + "',Sdt='" + hv.getSdt() + "',QuocGia=N'"
				+ hv.getQuocgia() + "'," + "VungMien=N'" + hv.getVungmien() + "',DiaChi=N'" + hv.getDiachi()
				+ "',TrinhDo=N'" + hv.getTrinhdo() + "', Email='" + hv.getEmail() + "'"
				+ " where NguoiDung.MaNguoiDung=" + hv.getManguoidung() + "";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}

	
}
