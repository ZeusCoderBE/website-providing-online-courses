package vn.iotstar.model;

import java.util.Date;

public class BaiTap {
	private String tenBaiTap;
	private int maMaiHoc;
	private double thoiGianHoanThanh;
	
	public BaiTap(String tenBaiTap, int maBaiHoc, double thoiGianHoanThanh) {
		this.tenBaiTap = tenBaiTap;
		this.maMaiHoc = maBaiHoc;
		this.thoiGianHoanThanh = thoiGianHoanThanh;
	}
	
	public String getTenBaiTap() {
		return tenBaiTap;
	}
	public void setTenBaiTap(String tenBaiTap) {
		this.tenBaiTap = tenBaiTap;
	}
	public double getThoiGianHoanThanh() {
		return thoiGianHoanThanh;
	}
	public void setThoiGianHoanThanh(double thoiGianHoanThanh) {
		this.thoiGianHoanThanh = thoiGianHoanThanh;
	}
	public int getMaMaiHoc() {
		return maMaiHoc;
	}
	public void setMaMaiHoc(int maMaiHoc) {
		this.maMaiHoc = maMaiHoc;
	}
}
