package vn.iotstar.model;

import vn.iotstar.database.DataBaseConnection;

public class HocVienDao {
	DataBaseConnection dbC = new DataBaseConnection();

	public int InsertHocVien() {
		String sql = "sp_TimTaiKhoanHocVien";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}

	public int UpdateHocVien(HocVien hv) {
		String sql = "Update NguoiDung set HoTen=N'" + hv.getHoten() + "',Sdt='" + hv.getSdt() + "',QuocGia=N'"
				+ hv.getQuocgia() + "'," + "VungMien=N'" + hv.getVungmien() + "',DiaChi=N'" + hv.getDiachi()
				+ "',TrinhDo=N'" + hv.getTrinhdo() + "'" + " where NguoiDung.MaNguoiDung=" + hv.getManguoidung() + "";
		int ketqua = dbC.ExecuteCommand(sql);
		return ketqua;
	}

	public int UpdateMatKhauHocVien(HocVien hv) {
		String sql = "Update NguoiDung set MatKhau='" + hv.getMatkhau() + "' where NguoiDung.MaNguoiDung="
				+ hv.getManguoidung() + "";
		int ketqua=dbC.ExecuteCommand(sql);
		return ketqua;
	}
}
