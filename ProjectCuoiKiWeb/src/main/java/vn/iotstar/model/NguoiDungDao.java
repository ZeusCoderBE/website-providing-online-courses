package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class NguoiDungDao {
	DataBaseConnection dbconn = new DataBaseConnection();
	public int SignUp(NguoiDung hv)
	{
		String query="Insert into NguoiDung(HoTen,Email,QuocGia,MatKhau)"
				+ "values(N'"+hv.getHoten()+"',N'"+hv.getEmail()+"',N'"+hv.getQuocgia()+"',"
						+ "N'"+hv.getMatkhau()+"')";
		int ketqua=dbconn.ExecuteCommand(query);
		return ketqua;
	}
	public HocVien TimThongTinDN(String email) throws ClassNotFoundException, SQLException
	{
		String sql="sp_TimThongTinHocVien '"+email+"'";
		ResultSet rs=dbconn.ExecuteQuery(sql);
		HocVien hv= new HocVien();
		while(rs.next())
		{
			hv=new HocVien(rs.getInt("MaHocVien"), rs.getNString("HoTen"),rs.getString("Email")
					,rs.getString("Sdt"),rs.getNString("QuocGia"),rs.getNString("VungMien"),
					rs.getNString("DiaChi"),rs.getNString("TrinhDo"),rs.getNString("loaitaikhoan"));
		}
		return hv;
	}
	public boolean checkDangNhap(String email, String password) {
		String sqlStr = "SELECT * FROM NGUOIDUNG WHERE Email='" + email + "'" + "AND MatKhau='" + password + "'";
		boolean check = false;

		try {
			ResultSet rs = dbconn.ExecuteQuery(sqlStr);
			if (rs.next()) {
				check = true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
	public int getForgetPass(String email, String newpass, String checkpass) {
		String sqlStr = "SELECT * FROM NGUOIDUNG WHERE Email='" + email + "'";
		ResultSet rs;
		try {
			rs = dbconn.ExecuteQuery(sqlStr);
			if (rs.next() && checkpass.equals(newpass)) {
				sqlStr = "UPDATE NGUOIDUNG SET MatKhau='" + newpass + "'" + "WHERE Email='" + email + "'";
				dbconn.ExecuteCommand(sqlStr);
			}
			else {
				return 0;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
}
