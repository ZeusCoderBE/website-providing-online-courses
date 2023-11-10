package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class NguoiDungDao {
	DataBaseConnection dbconn = new DataBaseConnection();
	public int SignUp(NguoiDung hv)
	{
		String query="Insert into NguoiDung(HoTen,Email,QuocGia,MatKhau,Sdt)"
				+ "values(N'"+hv.getHoten()+"',N'"+hv.getEmail()+"',N'"+hv.getQuocgia()+"',"
						+ "N'"+hv.getMatkhau()+"','"+hv.getSdt()+"')";
		int ketqua=dbconn.ExecuteCommand(query);
		return ketqua;
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
	public int UpdateMatKhau(String matkhau,int manguoidung) {
		String sql = "Update NguoiDung set MatKhau='" + matkhau + "' where NguoiDung.MaNguoiDung="
				+ manguoidung+ "";
		int ketqua = dbconn.ExecuteCommand(sql);
		System.out.print(sql);
		return ketqua;
	}
}
