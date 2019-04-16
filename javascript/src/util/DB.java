package util;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch(Throwable e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:oracle:thin:@192.168.0.69:1521:xe","hr","hr");
	}
}



//Class.forName("com.mysql.jdbc.Driver");
//return DriverManager.getConnection(
//		"jdbc:mysql://localhost:3306/test?useUnicode=true&amp;characterEncoding=euckr",
//		"root",
//		"root"
//	);