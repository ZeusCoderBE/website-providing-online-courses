package vn.iotstar.model;

import vn.iotstar.database.DataBaseConnection;

public class HocVienDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int InsertHocVien() {
		String sql = "sp_TimTaiKhoanHocVien";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
}
