package vn.iotstar.model;

import java.sql.SQLException;

import vn.iotstar.database.DataBaseConnection;

public class LamBaiTapDAO {
	
	DataBaseConnection dbC = new DataBaseConnection();
	
	public void NopBaiTap(LamBaiTap lbt) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("EXECUTE sp_NopBaiTap @mand = %d, @TenBaiTap = N'%s', @mabaihoc = %d, @filebailam = '%s';", lbt.getMaNguoiDung(), lbt.getTenBaiTap(), lbt.getMaBaiHoc(), lbt.getFileBaiLam());
		dbC.ExecuteCommand(sqlStr);
	}
}
