package DBmanager;

import java.sql.*;

public class DBManager {
	
	public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String user = "tester2"; 
	public static String pass = "1234"; 
	
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			   Class.forName("oracle.jdbc.driver.OracleDriver"); //이 드라이버를 쓸꺼라고 매니저한테 지정해주는 것.
			   conn = DriverManager.getConnection(url,user,pass);
			    
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static void close(PreparedStatement psmt,Connection conn) {
		try {
		psmt.close();
		conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement psmt,Connection conn,ResultSet rs) {
		try {
			psmt.close();
			conn.close();
			rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
}
