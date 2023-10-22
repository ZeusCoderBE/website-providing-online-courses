package vn.iotstar.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection initialiseDatabase() throws SQLException, ClassNotFoundException {
		String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433";
		
		String dbName = "laptrinhweb";
		String dbUsername = "sa";
		String dbPassword = "123456";
		String connection = dbURL + ";databaseName=" + dbName;
		Connection conn = null;
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(connection, dbUsername, dbPassword);
			System.out.println("connected successfully");
		}
		catch (Exception ex) {
			System.out.println("connected failed");
			ex.printStackTrace();
		}
		return conn;
	}
}
