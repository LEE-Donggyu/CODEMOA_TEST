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
	
	public String findid(User user) {
	    String SQL = "SELECT ID FROM MEMBERS WHERE NAME = ? AND EMAIL = ?";
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, user.getUserName());
	        pstmt.setString(2, user.getUserMail());
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            String userID = rs.getString(1);
	            // 아이디 값을 사용하거나 리턴할 수 있습니다.
	            return userID;
	        }
	        return null; // 일치하는 정보가 없음
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null; // DB 오류
	}
	
	public String findpw(User user) {
	    String SQL = "SELECT ID FROM MEMBERS WHERE ID = ? AND NAME = ? AND EMAIL = ?";
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, user.getUserID());
	        pstmt.setString(2, user.getUserName());
	        pstmt.setString(3, user.getUserMail());
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            String userPW = rs.getString(1);
	            // 아이디 값을 사용하거나 리턴할 수 있습니다.
	            return userPW;
	        }
	        return null; // 일치하는 정보가 없음
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null; // DB 오류
	}
	
    public User getUserByID(String userID) {
        User user = null;

        try {
            String SQL = "SELECT * FROM MEMBERS WHERE ID = ?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getString("ID"));
                user.setUserPW(rs.getString("PW"));
                user.setUserName(rs.getString("NAME"));
                user.setUserMail(rs.getString("EMAIL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            closeResources(pstmt, rs);
        }

        return user;
    }
    
    private void closeResources(PreparedStatement preparedStatement, ResultSet resultSet) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
            	pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    public int changePassword(String userID, String currentPW, String newPW, String newPWCheck) {
        // 현재 비밀번호 확인
        String SQL = "SELECT PW FROM MEMBERS WHERE ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPW = rs.getString("PW");
                if (!storedPW.equals(currentPW)) {
                    return -2; // 현재 비밀번호가 일치하지 않음
                }
            } else {
                return 0; // 해당 유저가 존재하지 않음
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // DB 오류
        }
        
        if (!newPW.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")) {
            return -3; // 새로운 비밀번호가 규칙에 맞지 않음
        }

        // 새로운 비밀번호 설정
        if (!newPW.equals(newPWCheck)) {
            return -1; // 새로운 비밀번호와 확인 비밀번호가 일치하지 않음
        }
        

        // 비밀번호 변경
        SQL = "UPDATE MEMBERS SET PW = ? WHERE ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, newPW);
            pstmt.setString(2, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // DB 오류
        }

        return 1; // 비밀번호 변경 성공
    }
    
    
	
}
