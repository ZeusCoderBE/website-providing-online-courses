package vn.iotstar.model;

import vn.iotstar.database.DataBaseConnection;

public class GiangVienDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int InsertGiangVien() {
		String sql = "declare @manguoidung int\r\n"
				+ "set @manguoidung=(SELECT  Top 1 MaNguoiDung FROM NGUOIDUNG\r\n"
				+ "ORDER BY MaNguoiDung desc)\r\n"
				+ "\r\n"
				+ "insert into GIANGVIEN(MaGiangVien)\r\n"
				+ "values(@manguoidung)";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
}	
