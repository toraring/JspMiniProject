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
			System.out.println("����");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("����̹� ����");
		}
		
	}
	/////////////////////////Ŀ�ؼ�
	public Connection getConnection()
	{
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, "katatj", "skfo0762");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Ŀ�ؼ� ����");
		}
		return conn;
	}
	
	///////////////////////////////////���
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Dbmain db = new Dbmain();
	}

}
