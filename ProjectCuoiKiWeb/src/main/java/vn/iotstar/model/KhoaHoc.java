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
	private String minhhoa;
	private String theloai;
	private String linhvuc;
	private double tiendo;
	private int soluong;
	private String tentacgia;

	public String getLinhvuc() {
		return linhvuc;
	}

	public int getSoluong() {
		return soluong;
	}

	public Double getTiendo() {
		return tiendo;
	}

	public String getTentacgia() {
		return tentacgia;
	}

	public String getTheloai() {
		return theloai;
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

	public String getMinhhoa() {
		return minhhoa;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc) {
		this.makhoahoc = makhoahoc;
		this.tenkhoahoc = tenkhoahoc;
	}

	public KhoaHoc(int makhoahoc, int soluong) {
		this.makhoahoc = makhoahoc;
		this.soluong = soluong;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc, String trinhdodauvao, String minhhoa) {
		this.makhoahoc = makhoahoc;
		this.tenkhoahoc = tenkhoahoc;
		this.trinhdodauvao = trinhdodauvao;
		this.minhhoa = minhhoa;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc, int matacgia, double giatien, String ngonngu, double thoigian,
			String trinhdodauvao, Date ngayphathanh, String mota, int danhgia, String minhhoa) {
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
		this.minhhoa = minhhoa;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc, int matacgia, double giatien, String ngonngu, double thoigian,
			String trinhdodauvao, Date ngayphathanh, String mota, int danhgia, String theloai, String linhvuc,
			String minhhoa, String tentacgia) {
		this.tenkhoahoc = tenkhoahoc;
		this.matacgia = matacgia;
		this.giatien = giatien;
		this.ngonngu = ngonngu;
		this.thoigian = thoigian;
		this.trinhdodauvao = trinhdodauvao;
		this.ngayphathanh = ngayphathanh;
		this.mota = mota;
		this.danhgia = danhgia;
		this.theloai = theloai;
		this.linhvuc = linhvuc;
		this.makhoahoc = makhoahoc;
		this.minhhoa = minhhoa;
		this.tentacgia = tentacgia;
	}

	public KhoaHoc(String tenkhoahoc, int danhgia, int matacgia, String trinhdodauvao, Double giatien, Double thoigian,
			String linhvuc, Date ngayphathanh, int makhoahoc) {
		this.tenkhoahoc = tenkhoahoc;
		this.danhgia = danhgia;
		this.matacgia = matacgia;
		this.trinhdodauvao = trinhdodauvao;
		this.giatien = giatien;
		this.thoigian = thoigian;
		this.linhvuc = linhvuc;
		this.ngayphathanh = ngayphathanh;
		this.makhoahoc = makhoahoc;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc, String trinhdodauvao, String mota, String minhhoa, Double tiendo) {
		this.tenkhoahoc = tenkhoahoc;
		this.trinhdodauvao = trinhdodauvao;
		this.makhoahoc = makhoahoc;
		this.mota = mota;
		this.minhhoa = minhhoa;
		this.tiendo = tiendo;
	}

	public KhoaHoc(int makhoahoc, String tenkhoahoc, String trinhdodauvao, String mota, String minhhoa) {
		this.tenkhoahoc = tenkhoahoc;
		this.trinhdodauvao = trinhdodauvao;
		this.makhoahoc = makhoahoc;
		this.mota = mota;
		this.minhhoa = minhhoa;
	}

	public KhoaHoc(int matacgia, double giatien) {
		this.matacgia = matacgia;
		this.giatien = giatien;
	}

	public KhoaHoc() {

	}

	public KhoaHoc(int makhoahoc) {
		this.makhoahoc = makhoahoc;
	}

}
