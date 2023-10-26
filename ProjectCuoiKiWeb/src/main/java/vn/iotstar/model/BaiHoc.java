package vn.iotstar.model;

import java.sql.Date;

public class BaiHoc {

	private int mabaihoc;
	private int makhoahoc;
	private String tenbaihoc;
	private Double thoigianhoanthanh;
	private String noidungbaihoc;
	private Double muctieudaura;
	private Date ngaydang;
	
	public int getMakhoahoc() {
		return makhoahoc;
	}
	
	public int getMabaihoc() {
		return mabaihoc;
	}

	public String getTenbaihoc() {
		return tenbaihoc;
	}

	public Double getThoigianhoanthanh() {
		return thoigianhoanthanh;
	}

	public String getNoidungbaihoc() {
		return noidungbaihoc;
	}

	public Double getMuctieudaura() {
		return muctieudaura;
	}

	public Date getNgaydang() {
		return ngaydang;
	}

	public BaiHoc(int mabaihoc, String tenbaihoc, Double thoigianhoanthanh, String noidungbaihoc, Double muctieudaura,
			Date ngaydang,int makhoahoc) 
	{
		this.mabaihoc = mabaihoc;
		this.tenbaihoc = tenbaihoc;
		this.thoigianhoanthanh = thoigianhoanthanh;
		this.noidungbaihoc = noidungbaihoc;
		this.muctieudaura = muctieudaura;
		this.ngaydang = ngaydang;
		this.makhoahoc=makhoahoc;
	}

	public BaiHoc() {

	}
}
