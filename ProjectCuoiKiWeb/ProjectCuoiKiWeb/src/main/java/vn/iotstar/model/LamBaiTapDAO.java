package vn.iotstar.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.database.DataBaseConnection;

public class LamBaiTapDAO {
	
	DataBaseConnection dbC = new DataBaseConnection();
	
	public void NopBaiTap(LamBaiTap lbt) throws SQLException, ClassNotFoundException {
		String sqlStr = String.format("EXECUTE sp_NopBaiTap @mand = %d, @TenBaiTap = N'%s', @mabaihoc = %d, @filebailam = '%s';", lbt.getMaNguoiDung(), lbt.getTenBaiTap(), lbt.getMaBaiHoc(), lbt.getFileBaiLam());
		dbC.ExecuteCommand(sqlStr);
	}
	
	public String LoadBaiTap(int mahv, int mabh ) throws SQLException, ClassNotFoundException {
		//List<LamBaiTap>
	    String sqlStr = String.format("EXECUTE sp_DSBaiTap %d, %d", mahv, mabh);
	    ResultSet rs = dbC.ExecuteQuery(sqlStr);
	    LamBaiTap lbt = new LamBaiTap();
		//List<LamBaiTap> dslambaitap = new ArrayList<>();
	    while (rs.next() == true) {
	    	lbt = new LamBaiTap(rs.getInt("MaNguoiDung"), rs.getInt("MaBaiHoc"), rs.getString("FileBaiLam"));
			//dslambaitap.add(lbt);
		}
		return lbt.getFileBaiLam();
	}
	
	public List<LamBaiTap> DSNopBaiTap(int mabh ) throws SQLException, ClassNotFoundException {
	    String sqlStr = String.format("EXECUTE sp_DSBaiTapGV %d", mabh);
	    ResultSet rs = dbC.ExecuteQuery(sqlStr);
	    LamBaiTap lbt = new LamBaiTap();
		List<LamBaiTap> dsLbt = new ArrayList<>();
	    while (rs.next() == true) {
	    	lbt = new LamBaiTap(rs.getInt("MaNguoiDung"), rs.getInt("MaBaiHoc"), rs.getString("FileBaiLam"));
	    	dsLbt.add(lbt);
	    	System.out.print(lbt.getFileBaiLam());
		}
		return dsLbt;
	}
}
