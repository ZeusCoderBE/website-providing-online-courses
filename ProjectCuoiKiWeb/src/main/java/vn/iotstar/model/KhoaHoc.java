package vn.iotstar.model;

import java.sql.Date;

public class KhoaHoc {

	private int makhoahoc;
	private String tenkhoahoc;
	private int matacgia;
	private double giatien;
	private String ngonngu;
	private double thoigian;
	private String trinhdodauvao;
	private Date ngayphathanh;
	private String mota;
	private int danhgia;
	private String linhvuc;

	public String getLinhvuc() {
		return linhvuc;
	}

	public int getMakhoahoc() {
		return makhoahoc;
	}

	public String getTenkhoahoc() {
		return tenkhoahoc;
	}

	public int getMatacgia() {
		return matacgia;
	}

	public double getGiatien() {
		return giatien;
	}

	public String getNgonngu() {
		return ngonngu;
	}

	public double getThoigian() {
		return thoigian;
	}

	public String getTrinhdodauvao() {
		return trinhdodauvao;
	}

	public Date getNgayphathanh() {
		return ngayphathanh;
	}

	public String getMota() {
		return mota;
	}

	public int getDanhgia() {
		return danhgia;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc, int matacgia, double giatien, String ngonngu, double thoigian,
			String trinhdodauvao, Date ngayphathanh, String mota, int danhgia) {
		this.makhoahoc = makhoahoc;
		this.tenkhoahoc = tenkhoahoc;
		this.matacgia = matacgia;
		this.giatien = giatien;
		this.ngonngu = ngonngu;
		this.thoigian = thoigian;
		this.trinhdodauvao = trinhdodauvao;
		this.ngayphathanh = ngayphathanh;
		this.mota = mota;
		this.danhgia = danhgia;
	}
	public KhoaHoc(String tenkhoahoc,int danhgia,int matacgia,
			String trinhdodauvao,Double giatien,Double thoigian,String linhvuc)
	{
		this.tenkhoahoc=tenkhoahoc;
		this.danhgia=danhgia;
		this.matacgia=matacgia;
		this.trinhdodauvao=trinhdodauvao;
		this.giatien=giatien;
		this.thoigian=thoigian;
		this.linhvuc=linhvuc;
	}
	public KhoaHoc(int makhoahoc,String tenkhoahoc, String trinhdodauvao,String mota) {
		this.tenkhoahoc = tenkhoahoc;
		this.trinhdodauvao = trinhdodauvao;
		this.makhoahoc=makhoahoc;
		this.mota=mota;
	}

	public KhoaHoc()
	{
		
	}

	public KhoaHoc(int makhoahoc) {
		this.makhoahoc = makhoahoc;
	}

}
