package vn.iotstar.model;

public class LamBaiTap {
	private int maNguoiDung;
	private String tenBaiTap;
	private int maBaiHoc;
	private int diemSo;
	private String fileBaiLam;
	
	public LamBaiTap(int maNguoiDung, String tenBaiTap, int maBaiHoc, String fileBaiTap) {
		this.maNguoiDung = maNguoiDung;
		this.tenBaiTap = tenBaiTap;
		this.maBaiHoc = maBaiHoc;
		this.fileBaiLam = fileBaiTap;
	}	
	
	public LamBaiTap(int maNguoiDung, int maBaiHoc, String fileBaiTap) {
		this.maNguoiDung = maNguoiDung;
		this.maBaiHoc = maBaiHoc;
		this.fileBaiLam = fileBaiTap;
	}	
	
	public LamBaiTap() {
		// TODO Auto-generated constructor stub
	}

	public int getMaNguoiDung() {
		return maNguoiDung;
	}
	
	public void setMaNguoiDung(int maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}
	
	public String getTenBaiTap() {
		return tenBaiTap;
	}
	
	public void setTenBaiTap(String tenBaiTap) {
		this.tenBaiTap = tenBaiTap;
	}
	
	public int getMaBaiHoc() {
		return maBaiHoc;
	}
	
	public void setMaBaiHoc(int maBaiHoc) {
		this.maBaiHoc = maBaiHoc;
	}
	
	public int getDiemSo() {
		return diemSo;
	}
	
	public void setDiemSo(int diemSo) {
		this.diemSo = diemSo;
	}
	
	public String getFileBaiLam() {
		return fileBaiLam;
	}
	
	public void setFileBaiLam(String fileBaiLam) {
		this.fileBaiLam = fileBaiLam;
	}
}
