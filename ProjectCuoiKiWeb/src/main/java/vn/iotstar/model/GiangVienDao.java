package vn.iotstar.model;

import vn.iotstar.database.DataBaseConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class GiangVienDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int InsertGiangVien() {
		String sql = "exec sp_TimTaiKhoanGiangVien";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
	public int InsertCompilation(int manguoidung)
	{
		String dml="exec sp_CreateCompilation "+manguoidung+"";
		int ketqua=dbC.ExecuteCommand(dml);
		return ketqua;
	}
	public int UpdateofCardTeacher(KhoaHoc khoahoc)
	{
		String dml="exec sp_CapNhatSoDuTKGV  "+khoahoc.getMatacgia()+","+khoahoc.getGiatien()+"";
		int ketqua=dbC.ExecuteCommand(dml);
		return ketqua;
	}
	public GiangVien TimThongTinDN(String email) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM vThongTinGiangVien AS vtt" + "\t WHERE vtt.Email = '" + email + "'";
		ResultSet rs = dbC.ExecuteQuery(sql);
		GiangVien giangvien = new GiangVien();
		while (rs.next()) {
			giangvien = new GiangVien(rs.getInt("MaGiangVien"), rs.getNString("HoTen"), rs.getString("Email"),
					rs.getString("Sdt"), rs.getNString("QuocGia"), rs.getNString("VungMien"), rs.getNString("DiaChi"),
					rs.getNString("TrinhDo"), rs.getString("MatKhau"), rs.getNString("ChuyenNganh"));
		}
		return giangvien;
	}
	public GiangVien TimThongTinDN_id(int manguoidung) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM vThongTinGiangVien AS vtt" + "\t WHERE vtt.MaGiangVien = " + manguoidung + "";
		ResultSet rs = dbC.ExecuteQuery(sql);
		GiangVien giangvien = new GiangVien();
		while (rs.next()) {
			giangvien = new GiangVien(rs.getInt("MaGiangVien"), rs.getNString("HoTen"), rs.getString("Email"),
					rs.getString("Sdt"), rs.getNString("QuocGia"), rs.getNString("VungMien"), rs.getNString("DiaChi"),
					rs.getNString("TrinhDo"), rs.getString("MatKhau"), rs.getNString("ChuyenNganh"));
		}
		return giangvien;
	}

	public int UpdateGiangVien(GiangVien gv) {
		String sql = "exec sp_UpdateNguoiDung " + gv.getManguoidung() + ",N'" + gv.getHoten() + "',N'" + gv.getSdt()
				+ "'," + "N'" + gv.getQuocgia() + "',N'" + gv.getVungmien() + "',N'" + gv.getDiachi() + "',N'"
				+ gv.getTrinhdo() + "','" + gv.getEmail() + "'";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}

	public int UpdateChuyenNganhGV(GiangVien gv) {
		String sql = "exec sp_UpdateChuyenNganhGV  N'" + gv.getChuyennganh() + "'," + gv.getManguoidung() + "";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}

	public boolean CheckDNGiangVien(String email, String password) {
		String sql = "sp_CheckLoginGV ?,?,?";
		List<Object> param = new ArrayList<>();
		param.add(email);
		param.add(password);
		param.add(0);
		boolean check = false;
		try {
			Object result = dbC.ExecuteProcedure(sql, param);
			double ketqua = (double) result;
			if (ketqua == 1) {
				check = true;
			}
		} catch (Exception ex) {

		}
		return check;
	}
}
