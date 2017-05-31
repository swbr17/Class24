package kr.or.ksmart.driverdb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DriverDB {
	public Connection driverDbcon() throws ClassNotFoundException, SQLException{
		System.out.println("01 드라이버로딩 및 DB연결 driverDbcon DriverDB.java");
		Connection reconn = null;
		Class.forName("oracle.jdbc.OracleDriver");
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbUser = "dev24id";
		String dbPass = "dev24pw";
		reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		return reconn;
	}
	
}
