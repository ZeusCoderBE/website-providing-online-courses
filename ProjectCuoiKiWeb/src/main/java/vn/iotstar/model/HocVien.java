package vn.iotstar.model;

public class HocVien extends NguoiDung {
	
	private String loaitaikhoan;
	public HocVien(int manguoidung, String hoten, String email, String sdt, String quocgia, String vungmien,
			String diachi, String trinhdo,String matkhau,String loaitaikhoan )
	{
		super(manguoidung,hoten,email,sdt,quocgia,vungmien,diachi,trinhdo,matkhau);
	}
	public HocVien(String hoten,String email,String matkhau,String quocgia)
	{
		super(hoten,email,matkhau,quocgia);
	}
	public String getLoaitaikhoan() {
		return loaitaikhoan;
	}
	public HocVien (int manguoidung,String hoten)
	{
		super(manguoidung,hoten);
	}
	public HocVien(int manguoidung)
	{
		super(manguoidung);
	}
	public HocVien()
	{
		
	}
}
