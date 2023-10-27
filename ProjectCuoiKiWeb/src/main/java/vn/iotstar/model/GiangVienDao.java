package vn.iotstar.model;

import vn.iotstar.database.DataBaseConnection;

public class GiangVienDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int InsertGiangVien() {
		String sql = "sp_TimTaiKhoanGiangVien";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
}	
