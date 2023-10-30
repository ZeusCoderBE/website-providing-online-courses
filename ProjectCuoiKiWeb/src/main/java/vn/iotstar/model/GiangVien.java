package vn.iotstar.model;

public class GiangVien extends NguoiDung {

	private String chuyennganh;
	public GiangVien(int manguoidung, String hoten, String email, String sdt, String quocgia, String vungmien,
			String diachi, String trinhdo,String matkhau,String chuyennganh)
	{
		super(manguoidung,hoten,email,sdt,quocgia,vungmien,diachi,trinhdo,matkhau);
		this.chuyennganh=chuyennganh;
	}
	public String getChuyennganh()
	{
		return chuyennganh;
	}
	public GiangVien(int manguoidung)
	{
		super(manguoidung);
	}
	public  GiangVien (int manguoidung,String chuyennganh)
	{
		super(manguoidung);
		this.chuyennganh=chuyennganh;
	}
	public GiangVien(String hoten,String email,String matkhau,String quocgia,String sdt)
	{
		super(hoten,email,matkhau,quocgia,sdt);
	}
}
