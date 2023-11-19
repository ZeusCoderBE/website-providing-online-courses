package vn.iotstar.database;

import java.sql.*;
import java.util.*;

public class DataBaseConnection {
	public Connection initializeDatabase() throws SQLException, ClassNotFoundException {
		String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433";
		String dbName = "ONCOURSE";
		String dbUsername = "sa";
		String dbPassword = "123456";
		String connectionURL = dbURL + ";databaseName=" + dbName;
		Connection conn = null;
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(connectionURL, dbUsername, dbPassword);
			System.out.println("connect successfully!");
		} catch (Exception ex) {
			System.out.println("connect failure!");
			ex.printStackTrace();
		}
		return conn;
	}

	public ResultSet ExecuteQuery(String sql) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		try {
			conn = initializeDatabase();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			return null;
		}
	}

	public Object ExecuteProcedure(String procedurename,List<Object>param)
	{
		Connection conn=null;
		CallableStatement call=null;
		Object result=null;
		try
		{
			conn=initializeDatabase();
			call=conn.prepareCall(procedurename);
		
		
		if(param!=null)
		{
			for(int i =0;i<param.size()-1;i++)
			{
				call.setObject(i+1, param.get(i));
			}
			call.registerOutParameter(param.size(), Types.DOUBLE);
		}
			call.execute();
			result=call.getDouble(param.size());
			call.close();
			CloseConnection(conn);
	   }
		catch(Exception ex)
		{
		
		}
		return result;
	}

	public int ExecuteCommand(String sql) {
		Connection conn = null;
		try {
			conn = initializeDatabase();
			Statement stmt = conn.createStatement();
			int ketqua = stmt.executeUpdate(sql);
			if (ketqua > 0) {
				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		} finally {
			CloseConnection(conn);
		}
	}

	public void CloseConnection(Connection c) {
		try {
			if (c != null) {
				System.out.println("Dong");
				c.close();
			}
		} catch (Exception e) {
			System.out.println("Lỗi");
			e.printStackTrace();
		}
	}
}
