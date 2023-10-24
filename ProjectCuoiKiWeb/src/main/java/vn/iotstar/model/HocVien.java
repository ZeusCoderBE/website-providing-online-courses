package vn.iotstar.model;

public class HocVien extends NguoiDung {
	
	private String loaitaikhoan;
	public HocVien(int manguoidung, String hoten, String email, String matkhau, String sdt, String quocgia, String vungmien,
			String diachi, String trinhdo,String loaitaikhoan )
	{
		super(manguoidung,hoten,email,matkhau,sdt,quocgia,vungmien,diachi,trinhdo);
		this.loaitaikhoan=loaitaikhoan;
	}
	public String getLoaitaikhoan() {
		return loaitaikhoan;
	}
	public HocVien()
	{
		
	}
}
