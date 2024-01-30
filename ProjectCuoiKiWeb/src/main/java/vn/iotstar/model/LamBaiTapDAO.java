package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.database.DataBaseConnection;

public class LamBaiTapDAO {

	DataBaseConnection dbC = new DataBaseConnection();

	public void NopBaiTap(LamBaiTap lbt) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format(
				"EXECUTE sp_NopBaiTap @mand = %d, " + "@TenBaiTap = N'%s', @mabaihoc = %d, @tenbainop=N'%s'",
				lbt.getMaNguoiDung(), lbt.getTenBaiTap(), lbt.getMaBaiHoc(), lbt.getTenbainop());
		dbC.ExecuteCommand(sqlStr);
	}

	public int RemoveBaiTap(LamBaiTap lbt) {
		String sqlStr = "Exec DeleteAssignments " + lbt.getMaNguoiDung() + ",'" + lbt.getTenBaiTap() + "',"
				+ lbt.getMaBaiHoc() + "";
		System.out.print(sqlStr);
		dbC.ExecuteCommand(sqlStr);
		int ketqua = dbC.ExecuteCommand(sqlStr);
		return ketqua;
	}

	public List<LamBaiTap> LoadBaiTap(int mahv, int mabh) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("EXECUTE sp_DSBaiTap %d, %d", mahv, mabh);
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		LamBaiTap lbt = new LamBaiTap();
		List<LamBaiTap> dsbaitap = new ArrayList<LamBaiTap>();
		while (rs.next() == true) {
			lbt = new LamBaiTap(rs.getNString("TenBaiNop"), rs.getInt("MaHocVien"), rs.getInt("MaBaiHoc"),
					rs.getNString("TenBaiTap"));
			dsbaitap.add(lbt);
		}
		return dsbaitap;
	}

	public int CheckBaiTap(String tenbaitap, int mabaihoc) {
		String dml = "sp_CheckTonTaiBaiTap N'" + tenbaitap + "'," + mabaihoc + "";
		System.out.print(dml);
		int ketqua = dbC.ExecuteCommand(dml);
		System.out.println(ketqua);
		return ketqua;
	}

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