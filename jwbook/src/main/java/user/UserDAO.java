package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		
		try {
			String dbURL = "jdbc:h2:tcp://localhost/~/jwbookdb";
			String dbID = "jwbook";
			String dbPW = "1234";
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}	
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT PW FROM MEMBERS WHERE ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 없음
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return -2; // DB 오류
	}
	
	public int signup(User user) {
		String SQL = "INSERT INTO MEMBERS VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserMail());
			return pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return -1;	// DB오류
	}
	
	public User getUser(String userID) {
	    String SQL = "SELECT * FROM MEMBERS WHERE ID = ?";
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, userID);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            User user = new User();
	            user.setUserID(rs.getString("ID"));
	            user.setUserPW(rs.getString("PW"));
	            user.setUserName(rs.getString("NAME"));
	            user.setUserMail(rs.getString("MAIL"));
	            return user;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null; // 회원정보가 없을 경우 null 반환
	}

	
}
