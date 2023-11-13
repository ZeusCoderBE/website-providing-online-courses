package vn.iotstar.model;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import vn.iotstar.database.DataBaseConnection;

public class KhoaHocDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public List<KhoaHoc> GetListCourses() throws ClassNotFoundException, SQLException {
		String query = "select *From KhoaHoc";
		ResultSet rs = dbC.ExecuteQuery(query);
		List<KhoaHoc> danhsachkh = new ArrayList<KhoaHoc>();
		KhoaHoc khoahoc = new KhoaHoc();
		while (rs.next() == true) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),
					rs.getInt("DanhGia"), rs.getString("MinhHoa"));
			danhsachkh.add(khoahoc);
		}
		return danhsachkh;
	}

	public List<KhoaHoc> CountSelectedCourses(List<String> selectedCourses)
			throws NumberFormatException, ClassNotFoundException, SQLException {
		List<KhoaHoc> selectedtemp = new ArrayList<>();
		for (String courseId : selectedCourses) {
			KhoaHoc course = FindCourseOfCustomer(new KhoaHoc(Integer.parseInt(courseId)));
			selectedtemp.add(course);
		}
		return selectedtemp;
	}

	public int EditACourse(KhoaHoc khoahoc) {
		String dml = "exec sp_EditACourse  " + khoahoc.getMakhoahoc() + ",N'" + khoahoc.getTenkhoahoc() + "',"
				+ khoahoc.getMatacgia() + "," + khoahoc.getGiatien() + "" + ",N'" + khoahoc.getNgonngu() + "',"
				+ khoahoc.getThoigian() + ",N'" + khoahoc.getTrinhdodauvao() + "','" + khoahoc.getNgayphathanh() + "'"
				+ ",N'" + khoahoc.getMota() + "',N'" + khoahoc.getTheloai() + "',N'" + khoahoc.getLinhvuc() + "','"
				+ khoahoc.getMinhhoa() + "'";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int RemoveAcourse(KhoaHoc khoahoc) {
		String dml = "exec sp_RemoveACourse " + khoahoc.getMakhoahoc() + "";
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public int CreateACourse(KhoaHoc khoahoc) {
		String dml = "exec sp_CreateACourse N'" + khoahoc.getTenkhoahoc() + "'," + khoahoc.getMatacgia() + ","
				+ khoahoc.getGiatien() + "" + ",N'" + khoahoc.getNgonngu() + "'," + khoahoc.getThoigian() + ",N'"
				+ khoahoc.getTrinhdodauvao() + "','" + khoahoc.getNgayphathanh() + "'" + ",N'" + khoahoc.getMota()
				+ "',N'" + khoahoc.getTheloai() + "',N'" + khoahoc.getLinhvuc() + "','" + khoahoc.getMinhhoa() + "'";
		System.out.print(dml);
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public KhoaHoc FindCourseOfCustomer(KhoaHoc khoahoc) throws ClassNotFoundException, SQLException {
		String query = "select *From KhoaHoc where MaKhoaHoc=" + khoahoc.getMakhoahoc() + "";
		ResultSet rs = dbC.ExecuteQuery(query);
		if (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),
					rs.getInt("DanhGia"), rs.getNString("TheLoai"), rs.getNString("LinhVuc"), rs.getString("MinhHoa"));

		}
		return khoahoc;
	}

	public List<KhoaHoc> FindMyLearning(int manguoidung) throws ClassNotFoundException, SQLException {
		String thucthi = "sp_XemKhoaHocCuaToi " + manguoidung + "";
		ResultSet rs = dbC.ExecuteQuery(thucthi);
		KhoaHoc khoahoc = new KhoaHoc();
		List<KhoaHoc> listkh = new ArrayList<KhoaHoc>();
		while (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getNString("TrinhDoDauVao"),
					rs.getNString("MoTa"), rs.getString("MinhHoa"));
			listkh.add(khoahoc);
		}
		return listkh;
	}

	public List<KhoaHoc> ShowMyCreateOfCourse(int manguoidung) throws ClassNotFoundException, SQLException {
		String sql = "select * From v_XemKhoaHocDaTao where MaGiangVien= " + manguoidung + "";
		KhoaHoc khoahoc;
		ResultSet rs = dbC.ExecuteQuery(sql);
		List<KhoaHoc> listkh = new ArrayList<KhoaHoc>();
		while (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getNString("TrinhDoDauVao"),
					rs.getNString("MoTa"), rs.getString("MinhHoa"));
			listkh.add(khoahoc);
		}
		return listkh;
	}

	public boolean KhoaHocDaTao(int manguoidung, int makhoahoc) throws ClassNotFoundException, SQLException {
		String sqlStr = "Select *From BienSoan where MaNguoiDung=" + manguoidung + " and MaKhoaHoc=" + makhoahoc + "";
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		if (rs.next()) {
			return true;
		}
		return false;
	}

	public boolean khoahocDangKy(int mand, int makh) throws SQLException, ClassNotFoundException {
		String sqlStr = "SELECT * FROM DANGKY WHERE MaNguoiDung=" + mand + "AND MaKhoaHoc=" + makh;
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		if (rs.next()) {
			return true;
		}
		return false;
	}
}
