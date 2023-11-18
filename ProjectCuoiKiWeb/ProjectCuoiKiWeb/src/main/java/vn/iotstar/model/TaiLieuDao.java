package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public int RemoveDocument(TaiLieu tailieu) {
		String dml = " sp_DeleteDocument " + tailieu.getMatailieu() + "";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int EditDocument(TaiLieu tailieu) {
		String dml = "exec sp_EditDocument " + tailieu.getMatailieu() + ",N'" + tailieu.getTheloai() + "','"
				+ tailieu.getDinhdangluutru() + "',N'" + tailieu.getDuongdanluutru() + "'";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public List<TaiLieu> FindDocumentofMylesson(int mabaihoc) throws ClassNotFoundException, SQLException {
		String dml = "Select *From v_xemdanhsachtailieu where MaBaiHoc=" + mabaihoc + " and MaTaiLieu is not null";
		TaiLieu tailieu = new TaiLieu();
		List<TaiLieu> dstailieu = new ArrayList<>();
		ResultSet rs = dbC.ExecuteQuery(dml);
		while (rs.next() == true) {
			tailieu = new TaiLieu(rs.getInt("MaKhoaHoc"), rs.getInt("MaBaiHoc"), rs.getInt("MaTaiLieu"),
					rs.getNString("TheLoai"), rs.getString("DinhDangLuuTru"), rs.getNString("DuongDanLuuTru"));
			dstailieu.add(tailieu);
		}
		return dstailieu;
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
