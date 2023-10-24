package vn.iotstar.model;

public class NguoiDung {
	private int manguoidung;
	private String hoten;
	private String email;
	private String sdt;
	private String quocgia;
	private String vungmien;
	private String diachi;
	private String trinhdo;
	private String matkhau;
	public int getManguoidung() {
		return manguoidung;
	}
	public String getHoten() {
		return hoten;
	}
	public String getEmail() {
		return email;
	}
	public String getSdt() {
		return sdt;
	}
	public String getMatkhau()
	{
		return matkhau;
	}
	public String getQuocgia() {
		return quocgia;
	}
	public String getVungmien() {
		return vungmien;
	}
	public String getDiachi() {
		return diachi;
	}
	public String getTrinhdo() {
		return trinhdo;
	}
	public NguoiDung(int manguoidung, String hoten, String email, String sdt, String quocgia, String vungmien,
			String diachi, String trinhdo,String matkhau) {
		this.manguoidung = manguoidung;
		this.hoten = hoten;
		this.email = email;
		this.sdt = sdt;
		this.quocgia = quocgia;
		this.vungmien = vungmien;
		this.diachi = diachi;
		this.trinhdo = trinhdo;
		this.matkhau=matkhau;
	}
	public NguoiDung(int manguoidung)
	{
		this.manguoidung=manguoidung;
	}
	public NguoiDung(String hoten,String email,String quocgia,String matkhau)
	{
		this.hoten=hoten;
		this.email=email;
		this.matkhau=matkhau;
		this.quocgia=quocgia;
		
	}
	public NguoiDung()
	{
		
	}
}
