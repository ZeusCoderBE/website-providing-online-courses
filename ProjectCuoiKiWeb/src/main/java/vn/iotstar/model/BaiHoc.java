package vn.iotstar.model;

import java.util.Date;

public class BaiHoc {

	private int mabaihoc;
	private String tenbaihoc;
	private Double thoigianhoanthanh;
	private String noidungbaihoc;
	private Double muctieudaura;
	private Date ngaydang;
	private int makhoahoc;
	private String duongdan;

<<<<<<< HEAD
	public String getDuongdan()
	{
		return duongdan;
	}
=======
>>>>>>> 819f5f740df16dc47281e345d2fa57b18f3881d3
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
			Date date, int makhoahoc) {
		this.mabaihoc = mabaihoc;
		this.tenbaihoc = tenbaihoc;
		this.thoigianhoanthanh = thoigianhoanthanh;
		this.noidungbaihoc = noidungbaihoc;
		this.muctieudaura = muctieudaura;
		this.ngaydang = date;
		this.makhoahoc = makhoahoc;
	}

	public BaiHoc() {

	}
<<<<<<< HEAD
	public BaiHoc(int mabaihoc,String tenbaihoc,int makhoahoc,String duongdan)
	{
		this.mabaihoc=mabaihoc;
		this.tenbaihoc=tenbaihoc;
		this.makhoahoc=makhoahoc;
		this.duongdan=duongdan;
	}
	public BaiHoc(int makhoahoc)
	{
		this.makhoahoc=makhoahoc;
=======

	public BaiHoc(int makhoahoc) {
		this.makhoahoc = makhoahoc;
>>>>>>> 819f5f740df16dc47281e345d2fa57b18f3881d3
	}
}
