package vn.iotstar.model;

import java.util.*;

public class ThanhToan {
	private int maNguoiDung;
	private int maKhoaHoc;
	private Date ngayThanhToan;
	private float tienThanhToan;
	
	public int getMaNguoiDung() {
		return maNguoiDung;
	}
	public int getMaKhoaHoc() {
		return maKhoaHoc;
	}
	public Date getNgayThanhToan() {
		return ngayThanhToan;
	}
	public float getTienThanhToan() {
		return tienThanhToan;
	}
	public ThanhToan(int maNguoiDung, int maKhoaHoc, float tienThanhToan) {
		super();
		this.maNguoiDung = maNguoiDung;
		this.maKhoaHoc = maKhoaHoc;
		this.tienThanhToan = tienThanhToan;
	}
	public ThanhToan() {
		
	}
	
}
