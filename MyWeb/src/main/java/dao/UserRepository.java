package dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.User;

public class UserRepository {
	
	private Connection conn; //db접근
	private PreparedStatement pstmt;	//db상태
	private ResultSet rs;

	
	public UserRepository() {//mysql에 접속을 하게 해줌,자동으로 데이터베이스 커넥션이 일어남
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
	
	public int login(String userID, String userPassword) {//로그인을 시도하는 함수
		String SQL="SELECT password FROM user WHERE id = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);//아이디가 일치하면 비밀번호를 가져온다.
			rs=pstmt.executeQuery();//rs에 실행한 결과를 넣어준다.
			if(rs.next()) {//결과가 존재한다면
				if(rs.getString(1).equals(userPassword))//sql문장을 실행해서 나온 결과와 접속을 시도했던 passwd비교
					return 1;//로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1;//아이디가 없음,rs의 결과가 존재 하지 않음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	//아이디 중복 체크 후 가입
	public int register(User user) {
		String SQL = "SELECT id FROM user WHERE id = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,user.getId());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//이미 있는 아이디
				return -1;
			}
			else {
				//가입
				SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				try {
					pstmt=conn.prepareStatement(SQL);
					pstmt.setString(1, user.getId());
					pstmt.setString(2, user.getPassword());
					pstmt.setString(3, user.getName());
					pstmt.setString(4, user.getSpec());
					pstmt.setString(5, user.getMajor());
					pstmt.setString(6, user.getMail());
					pstmt.setString(7, user.getPhone());
					pstmt.setString(8, user.getDescription());
					pstmt.executeUpdate();
					return 0; 
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public String geUserName(String userID) {//로그인을 시도하는 함수
		String SQL="SELECT name FROM user WHERE id = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);//아이디가 일치하면 비밀번호를 가져온다.
			rs=pstmt.executeQuery();//rs에 실행한 결과를 넣어준다.
			if(rs.next()) {//결과가 존재한다면
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
}
