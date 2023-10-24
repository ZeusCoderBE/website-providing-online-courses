package vn.iotstar.model;

public class GiangVien extends NguoiDung {

	private String chuyennganh;
	public GiangVien(int manguoidung, String hoten, String email, String matkhau, String sdt, String quocgia, String vungmien,
			String diachi, String trinhdo,String chuyennganh)
	{
		super(manguoidung, hoten, email, matkhau, sdt, quocgia, vungmien, diachi, trinhdo);
		this.chuyennganh=chuyennganh;
	}
	public String getChuyennganh()
	{
		return chuyennganh;
	}
}
