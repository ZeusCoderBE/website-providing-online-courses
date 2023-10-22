package vn.iotstar.model;

public class Student {
	private String name;
	private int mssv;
	//private int age;
	private String diachi;

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

//	public int getAge() {
//		return age;
//	}
//
//	public void setAge(int age) {
//		this.age = age;
//	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMssv() {
		return mssv;
	}

	public void setMssv(int mssv) {
		this.mssv = mssv;
	}
	 
	public Student() { 
		
	} 
	public Student(int mssv, String name, String diachi) { 
		this.diachi = diachi;
		this.name = name; 
		this.mssv = mssv; 
	}
}
