package dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.Book;
import dto.BookPage;

public class BookPageRepository {
	
	private Connection conn; //db접근
	private PreparedStatement pstmt;	//db상태
	private ResultSet rs;

	
	public BookPageRepository() {//mysql에 접속을 하게 해줌,자동으로 데이터베이스 커넥션이 일어남
		try {//예외처리
			String dbURL = "jdbc:mysql://localhost:3306/db?serverTimezone=UTC";
			String dbID="root";
			String dbPasseord="khj1123";
			Class.forName("com.mysql.jdbc.Driver");//mysql드라이버를 찾는다.
			//드라이버는 mysql에 접속할 수 있도록 매개체 역할을 하는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPasseord);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<String> getList(String bid) {
		ArrayList<String> filelist = new ArrayList<String>();
		String SQL = "SELECT filename from bookpage WHERE bid= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				filelist.add(rs.getString(1));
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return filelist;
	}
	
	public int addBookPage(String bid, String filename) {
		String SQL = "INSERT INTO bookpage VALUES (?, ?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, null);
			pstmt.setString(2, bid);
			pstmt.setString(3, filename);
			pstmt.executeUpdate();
			return 0; 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
