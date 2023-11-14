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
	public String getDuongdan()
	{
		return duongdan;
	}
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
	public BaiHoc(int mabaihoc,String tenbaihoc, String noidungbaihoc, Double muctieudaura, Date ngaydang, double tghoanthanh,int makhoahoc,String duongdan)
	{
		this.mabaihoc=mabaihoc;
		this.tenbaihoc=tenbaihoc;
		this.makhoahoc=makhoahoc;
		this.duongdan=duongdan;
		this.ngaydang=ngaydang;
		this.noidungbaihoc=noidungbaihoc;
		this.thoigianhoanthanh=tghoanthanh;
		this.muctieudaura=muctieudaura;
	}
	public BaiHoc(int makhoahoc)
	{
		this.makhoahoc=makhoahoc;
	}
}
