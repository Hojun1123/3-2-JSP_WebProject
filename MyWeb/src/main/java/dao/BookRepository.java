package dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.Book;

public class BookRepository {
	
	private Connection conn; //db접근
	private PreparedStatement pstmt;	//db상태
	private ResultSet rs;

	
	public BookRepository() {//mysql에 접속을 하게 해줌,자동으로 데이터베이스 커넥션이 일어남
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
	
	public ArrayList<Book> getList() {
		ArrayList<Book> booklist = new ArrayList<Book>();
		String SQL = "SELECT * from book";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book b = new Book();
				b.setId(rs.getString(1));
				b.setName(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setPublisher(rs.getString(6));
				b.setReleaseDate(rs.getString(7));
				b.setCondition(rs.getString(8));
				b.setFilename(rs.getString(9));
				b.setSeller(rs.getString(10));
				
				booklist.add(b);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return booklist;
	}
	
	public int addBook(Book book) {
		String SQL = "INSERT INTO book VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setString(1, book.getId());
			pstmt.setString(2, book.getName());
			pstmt.setString(3, book.getPrice());
			pstmt.setString(4, book.getAuthor());
			pstmt.setString(5, book.getDescription());
			pstmt.setString(6, book.getPublisher());
			pstmt.setString(7, book.getReleaseDate());
			pstmt.setString(8, book.getCondition());
			pstmt.setString(9, book.getFilename());
			pstmt.setString(10, book.getSeller());
			pstmt.executeUpdate();
			return 0; 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Book getBookById(String id) {
		String SQL = "SELECT * from book WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Book b = new Book();
				b.setId(rs.getString(1));
				b.setName(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setPublisher(rs.getString(6));
				b.setReleaseDate(rs.getString(7));
				b.setCondition(rs.getString(8));
				b.setFilename(rs.getString(9));
				b.setSeller(rs.getString(10));
				return b;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Book> getListByUserID(String seller) {
		ArrayList<Book> booklist = new ArrayList<Book>();
		String SQL = "SELECT * from book WHERE seller = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seller);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book b = new Book();
				b.setId(rs.getString(1));
				b.setName(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setPublisher(rs.getString(6));
				b.setReleaseDate(rs.getString(7));
				b.setCondition(rs.getString(8));
				b.setFilename(rs.getString(9));
				b.setSeller(rs.getString(10));
				
				booklist.add(b);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return booklist;
	}
	
	public int deleteBook(String id) {
		String SQL = "DELETE FROM book WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
