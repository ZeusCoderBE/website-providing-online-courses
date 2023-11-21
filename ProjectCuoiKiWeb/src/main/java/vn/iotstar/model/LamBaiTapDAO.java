package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.database.DataBaseConnection;

public class LamBaiTapDAO {

	DataBaseConnection dbC = new DataBaseConnection();

	public void NopBaiTap(LamBaiTap lbt) throws SQLException, ClassNotFoundException {
<<<<<<< HEAD
		String sqlStr = String.format(
				"EXECUTE sp_NopBaiTap @mand = %d, " + "@TenBaiTap = N'%s', @mabaihoc = %d, @tenbainop=N'%s'",
=======
		String sqlStr = String.format("EXECUTE sp_NopBaiTap @mand = %d, " + "@TenBaiTap = N'%s', @mabaihoc = %d, @tenbainop=N'%s'",
>>>>>>> 791261ca3cde6348ef51143a32401a63172d582e
				lbt.getMaNguoiDung(), lbt.getTenBaiTap(), lbt.getMaBaiHoc(), lbt.getTenbainop());
		System.out.print(sqlStr);
		dbC.ExecuteCommand(sqlStr);
	}

	public List<LamBaiTap> LoadBaiTap(int mahv, int mabh) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("EXECUTE sp_DSBaiTap %d, %d", mahv, mabh);
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		LamBaiTap lbt = new LamBaiTap();
		List<LamBaiTap> dsbaitap = new ArrayList<LamBaiTap>();
		while (rs.next() == true) {
<<<<<<< HEAD
			lbt = new LamBaiTap(rs.getNString("TenBaiNop"), rs.getInt("MaHocVien"), rs.getInt("MaBaiHoc"),
					rs.getNString("TenBaiTap"));
=======
			lbt = new LamBaiTap(rs.getNString("TenBaiNop"), rs.getInt("MaHocVien"), rs.getInt("MaBaiHoc"), rs.getNString("TenBaiTap"));
>>>>>>> 791261ca3cde6348ef51143a32401a63172d582e
			dsbaitap.add(lbt);
		}
		return dsbaitap;
	}

<<<<<<< HEAD
	public int CheckBaiTap(String tenbaitap, int mabaihoc) {
		String dml = "sp_CheckTonTaiBaiTap N'" + tenbaitap + "'," + mabaihoc + "";
		System.out.print(dml);
		int ketqua = dbC.ExecuteCommand(dml);
		System.out.println(ketqua);
		return ketqua;
	}

=======
>>>>>>> 791261ca3cde6348ef51143a32401a63172d582e
	public List<LamBaiTap> DSNopBaiTap(int mabh) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("EXECUTE sp_DSBaiTapGV %d", mabh);
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		LamBaiTap lbt = new LamBaiTap();
		List<LamBaiTap> dsLbt = new ArrayList<>();
		while (rs.next() == true) {
			lbt = new LamBaiTap(rs.getNString("TenBaiNop"), rs.getNString("HoTen"), rs.getInt("MaBaiHoc"),
					rs.getNString("TenBaiTap"));
			dsLbt.add(lbt);
		}
		return dsLbt;
	}
}