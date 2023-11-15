package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class TaiLieuDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int CreateDocument(TaiLieu tailieu) {
		String dml = "exec sp_CreateDocument N'" + tailieu.getTheloai() + "','" + tailieu.getDinhdangluutru() + "',N'"
				+ tailieu.getDuongdanluutru() + "'";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int CreateAttachment(int mabaihoc) {
		String dml = "exec sp_CreateAttachment " + mabaihoc + "";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int EditDocument(TaiLieu tailieu) {
		String dml = "exec sp_EditDocument " + tailieu.getMatailieu() + ",N'" + tailieu.getTheloai() + "','"
				+ tailieu.getDinhdangluutru() + "',N'" + tailieu.getDuongdanluutru() + "'";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public TaiLieu FindADocumen(TaiLieu tailieu) throws ClassNotFoundException, SQLException {
		String dml = "select *From TAILIEU  where MaTaiLieu=" + tailieu.getMatailieu() + "";
		ResultSet rs = dbC.ExecuteQuery(dml);
		TaiLieu tailieutim = new TaiLieu();
		if (rs.next()) {
			tailieutim = new TaiLieu(rs.getInt("MaTaiLieu"), rs.getNString("TheLoai"), rs.getString("DinhDangLuuTru"),
					rs.getString("DuongDanLuuTru"));
		}
		return tailieutim;
	}
}
