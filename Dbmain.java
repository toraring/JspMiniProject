package member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbmain {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	public Dbmain() 
	{
		try {
			Class.forName(driver);
			System.out.println("성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 실패");
		}
		
	}
	/////////////////////////커넥션
	public Connection getConnection()
	{
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, "katatj", "skfo0762");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션 실패");
		}
		return conn;
	}
	
	///////////////////////////////////출력
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Dbmain db = new Dbmain();
	}

}
