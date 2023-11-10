package vn.iotstar.model;

public class The {
	private String MaThe;
	private double SoDu;
	private int MaNguoiDung;
	
	public String getMaThe() {
		return MaThe;
	}
	public double getSoDu() {
		return SoDu;
	}
	public int getMaNguoiDung() {
		return MaNguoiDung;
	}
	public The(String maThe, double soDu, int maNguoiDung) {
		super();
		MaThe = maThe;
		SoDu = soDu;
		MaNguoiDung = maNguoiDung;
	}
	public The() {
		
	}
}
