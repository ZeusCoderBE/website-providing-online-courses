package vn.iotstar.model;

import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class BaiTapDAO {
	DataBaseConnection dbC = new DataBaseConnection();

	public int CreateBaiTap(BaiTap bt) throws ClassNotFoundException, SQLException {
		String sql = String.format("sp_UploadBaiTap N'%s', %d, %f", bt.getTenBaiTap(), bt.getMaMaiHoc(),
				bt.getThoiGianHoanThanh());
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
}