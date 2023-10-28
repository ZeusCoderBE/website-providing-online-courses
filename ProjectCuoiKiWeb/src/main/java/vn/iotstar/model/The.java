package vn.iotstar.model;

public class The {
	private String MaThe;
	private float SoDu;
	private int MaNguoiDung;
	
	public String getMaThe() {
		return MaThe;
	}
	public float getSoDu() {
		return SoDu;
	}
	public int getMaNguoiDung() {
		return MaNguoiDung;
	}
	public The(String maThe, float soDu, int maNguoiDung) {
		super();
		MaThe = maThe;
		SoDu = soDu;
		MaNguoiDung = maNguoiDung;
	}
	public The() {
		
	}
}
