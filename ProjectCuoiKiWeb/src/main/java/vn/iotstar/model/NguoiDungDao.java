package vn.iotstar.model;
import vn.iotstar.database.*;
public class NguoiDungDao {

	DataBaseConnection dbC=new DataBaseConnection();
	public int SignUp(NguoiDung hv)
	{
		String query="Insert into NguoiDung(HoTen,Email,QuocGia,MatKhau)"
				+ "values(N'"+hv.getHoten()+"',N'"+hv.getEmail()+"',N'"+hv.getQuocgia()+"',"
						+ "N'"+hv.getMatkhau()+"')";
		int ketqua=dbC.ExecuteCommand(query);
		return ketqua;
	}
}
