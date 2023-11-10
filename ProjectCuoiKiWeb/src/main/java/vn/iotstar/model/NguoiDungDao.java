package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class NguoiDungDao {
	DataBaseConnection dbconn = new DataBaseConnection();

	public int SignUp(NguoiDung hv) {
		String query = "exec sp_SignUp N'" + hv.getHoten() + "','" + hv.getEmail() + "',N'" + hv.getQuocgia() + "',N'"
				+ hv.getMatkhau() + "', '" + hv.getSdt() + "'";
		int ketqua = dbconn.ExecuteCommand(query);
		return ketqua;
	}

	public int getForgetPass(String email, String newpass, String checkpass) {
		String sqlStr = "SELECT * FROM NGUOIDUNG WHERE Email='" + email + "'";
		ResultSet rs;
		try {
			rs = dbconn.ExecuteQuery(sqlStr);
			if (rs.next() && checkpass.equals(newpass)) {
				sqlStr = "exec sp_ForgetMatKhau '"+email+"','"+newpass+"'";
				System.out.print(sqlStr);
				dbconn.ExecuteCommand(sqlStr);
			} else {
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

	public int UpdateMatKhau(String matkhau, int manguoidung) {
		String sql = " exec sp_UpdateMatKhau " + manguoidung + ",'" + matkhau + "'";
		int ketqua = dbconn.ExecuteCommand(sql);
		return ketqua;
	}
}
