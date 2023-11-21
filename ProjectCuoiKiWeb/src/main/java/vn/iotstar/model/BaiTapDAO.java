package vn.iotstar.model;

import java.sql.SQLException;
import java.util.Locale;

import vn.iotstar.database.DataBaseConnection;

public class BaiTapDAO {
	DataBaseConnection dbC = new DataBaseConnection();

	public int CreateBaiTap(BaiTap bt) throws ClassNotFoundException, SQLException {
<<<<<<< HEAD
		String sql = String.format(Locale.US,"sp_UploadBaiTap N'%s', %d, %f", bt.getTenBaiTap(), bt.getMaMaiHoc(),
=======
		String sql = String.format("sp_UploadBaiTap N'%s', %d, %f", bt.getTenBaiTap(), bt.getMaMaiHoc(),
>>>>>>> 791261ca3cde6348ef51143a32401a63172d582e
				bt.getThoiGianHoanThanh());
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}
}