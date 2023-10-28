package vn.iotstar.model;

public class HocVien extends NguoiDung {
	
	private String loaitaikhoan;
	public HocVien(int manguoidung, String hoten, String email, String sdt, String quocgia, String vungmien,
			String diachi, String trinhdo,String loaitaikhoan )
	{
		super(manguoidung,hoten,email,sdt,quocgia,vungmien,diachi,trinhdo);
		this.loaitaikhoan=loaitaikhoan;
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
