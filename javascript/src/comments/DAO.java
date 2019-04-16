package comments;

import java.sql.*;

public class DAO {
	
	protected Connection conn;
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
	 
//	String jdbc_driver = "com.mysql.jdbc.Driver";
//	String jdbc_url = "jdbc:mysql://localhost:3306/ajax?useUnicode=true&amp;characterEncoding=euckr";
//	
	public void connect(){
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"hr","hr");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public void disconnect(){
		try {
			if (conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
