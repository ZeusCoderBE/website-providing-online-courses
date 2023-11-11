package vn.iotstar.model;

public class TaiLieu {
	private int matailieu;
	private String tentailieu;
	private String dinhdangluutru;
	private String duongdanluutru;
	public int getMatailieu() {
		return matailieu;
	}
	public String getTentailieu() {
		return tentailieu;
	}
	public String getDinhdangluutru() {
		return dinhdangluutru;
	}
	public String getDuongdanluutru() {
		return duongdanluutru;
	}
	public TaiLieu(int matailieu)
	{
		this.matailieu=matailieu;
	}
	public TaiLieu(int matailieu,String tentailieu,String dinhdangluutru,String duongdanluutru)
	{
		this.matailieu=matailieu;
		this.tentailieu=tentailieu;
		this.dinhdangluutru=dinhdangluutru;
		this.duongdanluutru=duongdanluutru;
	}
	public TaiLieu(String tentailieu,String dinhdangluutru,String duongdanluutru)
	{
		this.tentailieu=tentailieu;
		this.dinhdangluutru=dinhdangluutru;
		this.duongdanluutru=duongdanluutru;
	}
	public TaiLieu()
	{
		
	}
}
