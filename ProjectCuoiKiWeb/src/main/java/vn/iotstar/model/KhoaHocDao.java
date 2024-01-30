package vn.iotstar.model;

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

	public KhoaHoc FindMaKhoaHoc(int makhoahoc) throws ClassNotFoundException, SQLException {
		String query = "select* From KhoaHoc where MaKhoaHoc=" + makhoahoc + "";
		KhoaHoc khkq = new KhoaHoc();
		ResultSet rs = dbC.ExecuteQuery(query);
		System.out.println(query);
		if (rs.next()) {
			khkq = new KhoaHoc(makhoahoc);
			System.out.println("1");
			return khkq;
		}
		System.out.println("2");
		return null;
	}

	public KhoaHoc CountSignIn(int makhoahoc) throws ClassNotFoundException, SQLException {
		String query = "select *From v_xemkhoahocdangky where MaKhoaHoc=" + makhoahoc + "";
		ResultSet rs = dbC.ExecuteQuery(query);
		KhoaHoc khoahoc = new KhoaHoc();
		if (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getInt("SoLuong"));
			return khoahoc;
		}
		return null;

	}

	public List<KhoaHoc> CountPopularCourse() throws ClassNotFoundException, SQLException {
		String query = "select Top 2 * From v_xemkhoahocdangky order by (SoLuong) desc";
		ResultSet rs = dbC.ExecuteQuery(query);
		KhoaHoc khoahoc = new KhoaHoc();
		List<KhoaHoc> listpop = new ArrayList<KhoaHoc>();
		while (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getNString("TrinhDoDauVao"),
					rs.getNString("MinhHoa"));
			listpop.add(khoahoc);
		}
		return listpop;
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
				+ ",N'" + khoahoc.getMota() + "',N'" + khoahoc.getTheloai() + "',N'" + khoahoc.getLinhvuc() + "',N'"
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
				+ "',N'" + khoahoc.getTheloai() + "',N'" + khoahoc.getLinhvuc() + "',N'" + khoahoc.getMinhhoa() + "'";
		System.out.print(dml);
		int ketqua = dbC.ExecuteCommand(dml);
		return ketqua;
	}

	public KhoaHoc FindCourseOfCustomer(KhoaHoc khoahoc) throws ClassNotFoundException, SQLException {
		String query = "select *From v_XemKhoaHocDaTao where MaKhoaHoc=" + khoahoc.getMakhoahoc() + "";
		ResultSet rs = dbC.ExecuteQuery(query);
		if (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getInt("MaTacGia"),
					rs.getDouble("GiaTien"), rs.getNString("NgonNgu"), rs.getDouble("ThoiGianHoanThanh"),
					rs.getNString("TrinhDoDauVao"), rs.getDate("NgayPhatHanh"), rs.getNString("MoTa"),
					rs.getInt("DanhGia"), rs.getNString("TheLoai"), rs.getNString("LinhVuc"), rs.getNString("MinhHoa"),
					rs.getNString("HoTen"));

		}
		return khoahoc;
	}

	public List<KhoaHoc> FindMyLearning(int manguoidung) throws ClassNotFoundException, SQLException {
		String thucthi = "sp_XemKhoaHocCuaToi " + manguoidung + "";
		ResultSet rs = dbC.ExecuteQuery(thucthi);
		KhoaHoc khoahoc = new KhoaHoc();
		List<KhoaHoc> listkh = new ArrayList<KhoaHoc>();
		while (rs.next()) {
			System.out.println(rs.getFloat("TienDo"));
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getNString("TrinhDoDauVao"),
					rs.getNString("MoTa"), rs.getNString("MinhHoa"), rs.getDouble("TienDo"));
			listkh.add(khoahoc);
		}
		return listkh;
	}

	public List<KhoaHoc> ShowMyCreateOfCourse(int manguoidung) throws ClassNotFoundException, SQLException {
		String sql = "select * From v_XemKhoaHocDaTao where MaTacGia= " + manguoidung + "";
		KhoaHoc khoahoc;
		ResultSet rs = dbC.ExecuteQuery(sql);
		List<KhoaHoc> listkh = new ArrayList<KhoaHoc>();
		while (rs.next()) {
			khoahoc = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"), rs.getNString("TrinhDoDauVao"),
					rs.getNString("MoTa"), rs.getNString("MinhHoa"));
			listkh.add(khoahoc);
		}
		return listkh;
	}

	public boolean KhoaHocDaTao(int manguoidung, int makhoahoc) throws ClassNotFoundException, SQLException {
		String sqlStr = "Select *From v_XemKhoaHocDaTao where MaTacGia=" + manguoidung + "and MaKhoaHoc=" + makhoahoc
				+ "";
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

	public KhoaHoc FindTenKhoaHoc(int makhoahoc) throws ClassNotFoundException, SQLException {
		String sqlStr = "select MaKhoaHoc, TenKhoaHoc from KhoaHoc where MaKhoaHoc =" + makhoahoc;
		ResultSet rs = dbC.ExecuteQuery(sqlStr);
		KhoaHoc kh = new KhoaHoc();
		while (rs.next()) {
			kh = new KhoaHoc(rs.getInt("MaKhoaHoc"), rs.getNString("TenKhoaHoc"));
			return kh;
		}
		return null;
	}
}
