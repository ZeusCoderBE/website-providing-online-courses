package vn.iotstar.model;

import java.util.*;

public class ThanhToan {
	private int maNguoiDung;
	private int maKhoaHoc;
	private Date ngayThanhToan;
	private float tienthanhtoan;
	private String ndThanhToan;
	
	public int getMaNguoiDung() {
		return maNguoiDung;
	}
	public int getMaKhoaHoc() {
		return maKhoaHoc;
	}
	public float getTienthanhtoan() {
		return tienthanhtoan;
	}
	public Date getNgayThanhToan() {
		return ngayThanhToan;
	}
	public String getNdThanhToan() {
		return ndThanhToan;
	}
	public ThanhToan(int maNguoiDung, int maKhoaHoc, float tienthanhtoan, String ndThanhToan) {
		super();
		this.maNguoiDung = maNguoiDung;
		this.maKhoaHoc = maKhoaHoc;
		this.ndThanhToan = ndThanhToan;
		this.tienthanhtoan = tienthanhtoan;
	}
	public ThanhToan() {
		
	}
	
}
