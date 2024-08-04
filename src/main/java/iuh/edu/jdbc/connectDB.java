package iuh.edu.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectDB {
	public connectDB() {
		super();
	}
	
	public static Connection getConnect() throws ClassNotFoundException {
		Connection con = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Perfume;user=sa; password=123;characterEncoding = UTF-8");
			System.out.println("Kết nốí thành công");
		} catch (SQLException e) {
			System.out.println("Két nối không thành công!"+e.getMessage());
		}
		return con;
	}
	
	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println(getConnect());
	}
}
