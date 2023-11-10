package vn.iotstar.model;

import java.sql.Date;

public class GioHang {
	private HocVien hocvien;
	private KhoaHoc khoahoc;
	private int numberofcourse; 
	
	public HocVien getHocvien() {
		return hocvien;
	}
	public int getNumberofcourse()
	{
		return numberofcourse;
	}
	public KhoaHoc getKhoahoc() {
		return khoahoc;
	}
	public GioHang(int numberofcourse)
	{
		this.numberofcourse=numberofcourse;
	}
	public GioHang(String hoten, String email, String tenkhoahoc, int danhgia, 
			int matacgia, String trinhdodauvao,double GiaTien,
			double thoigianhoanthanh,String linhvuc,Date ngayphathanh,int makhoahoc) {
		hocvien = new HocVien(hoten, email);
		khoahoc = new KhoaHoc(tenkhoahoc, danhgia, matacgia,
				trinhdodauvao,GiaTien,thoigianhoanthanh,linhvuc,ngayphathanh,makhoahoc);
	}

	public GioHang() {

	}
	public GioHang(int manguoidung,int makhoahoc)
	{
		hocvien=new HocVien(manguoidung);
		khoahoc=new KhoaHoc(makhoahoc);
	}

}
