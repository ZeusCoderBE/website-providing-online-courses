package vn.iotstar.model;

public class LamBaiTap {
	private int maNguoiDung;
	private String tenBaiTap;
	private int maBaiHoc;
	private String hoten;
	private String tenbainop;

	public LamBaiTap(String tenbainop, int maNguoiDung, int maBaiHoc, String tenBaiTap) {
		this.tenbainop = tenbainop;
		this.maNguoiDung = maNguoiDung;
		this.tenBaiTap = tenBaiTap;
		this.maBaiHoc = maBaiHoc;
	}

	public LamBaiTap(String tenbainop, String hoten, int maBaiHoc, String tenBaiTap) {
		this.tenbainop = tenbainop;
		this.hoten = hoten;
		this.tenBaiTap = tenBaiTap;
		this.maBaiHoc = maBaiHoc;
	}

	public LamBaiTap(String tenBaiTap, int mabaihoc, int manguoidung) {
		this.tenBaiTap = tenBaiTap;
		this.maBaiHoc = mabaihoc;
		this.maNguoiDung = manguoidung;
	}

	public LamBaiTap() {
		// TODO Auto-generated constructor stub
	}

	public int getMaNguoiDung() {
		return maNguoiDung;
	}

	public String getTenBaiTap() {
		return tenBaiTap;
	}

	public int getMaBaiHoc() {
		return maBaiHoc;
	}

	public String getTenbainop() {
		return tenbainop;
	}

	public String getHoten() {
		return hoten;
	}
}