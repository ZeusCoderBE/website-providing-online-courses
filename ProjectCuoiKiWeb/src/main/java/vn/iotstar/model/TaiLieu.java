package vn.iotstar.model;

public class TaiLieu {
	private int matailieu;
	private String theloai;
	private String dinhdangluutru;
	private String duongdanluutru;
	private KhoaHoc khoahoc;
	private BaiHoc baihoc;

	public int getMatailieu() {
		return matailieu;
	}

	public String getTheloai() {
		return theloai;
	}

	public String getDinhdangluutru() {
		return dinhdangluutru;
	}

	public String getDuongdanluutru() {
		return duongdanluutru;
	}

	public TaiLieu(int matailieu) {
		this.matailieu = matailieu;
	}

	public TaiLieu(int makhoahoc, int mabaihoc, int matailieu, String theloai, String dinhdangluutru,
			String duongdanluutru) {
		khoahoc = new KhoaHoc(makhoahoc);
		baihoc = new BaiHoc(mabaihoc);
		this.matailieu = matailieu;
		this.theloai = theloai;
		this.dinhdangluutru = dinhdangluutru;
		this.duongdanluutru = duongdanluutru;
	}

	public KhoaHoc getKhoahoc() {
		return khoahoc;
	}

	public BaiHoc getBaihoc() {
		return baihoc;
	}

	public TaiLieu(String theloai, String dinhdangluutru, String duongdanluutru) {
		this.theloai = theloai;
		this.dinhdangluutru = dinhdangluutru;
		this.duongdanluutru = duongdanluutru;
	}

	public TaiLieu(int matailieu, String theloai, String dinhdangluutru, String duongdanluutru) {
		this.matailieu = matailieu;
		this.theloai = theloai;
		this.dinhdangluutru = dinhdangluutru;
		this.duongdanluutru = duongdanluutru;
	}

	public TaiLieu() {

	}
}
