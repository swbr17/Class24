package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	
	public Connection driverDBcon() throws ClassNotFoundException, SQLException{
		System.out.println("001 driverDBcon driverDBcon.java");
		Connection recon = null;
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev24db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev24id";
		String dbPass = "dev24pw";
		recon = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		return recon;
	}
		
}
