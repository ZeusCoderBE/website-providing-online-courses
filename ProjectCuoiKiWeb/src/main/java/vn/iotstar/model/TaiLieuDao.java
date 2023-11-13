package vn.iotstar.model;
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
}
