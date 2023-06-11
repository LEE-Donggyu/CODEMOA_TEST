package write;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WriteDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public WriteDAO(){
		
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
	
	public int getNext() {
		String SQL = "SELECT ID FROM WRITE ORDER BY ID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String title, String userID, String content, String codeContent, String lang) {
		String SQL = "INSERT INTO WRITE VALUES(?, ?, ?, ?, ?, ?)";
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setInt(1, getNext());
	        pstmt.setString(2, title);
	        pstmt.setString(3, userID);
	        pstmt.setString(4, content);
	        pstmt.setString(5, codeContent);
	        pstmt.setString(6, lang);
	        return pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; //데이터베이스 오류
	}
	
	public ArrayList<Write> getList(int pageNumber) {
		String SQL = "SELECT * FROM WRITE WHERE ID < ? ORDER BY ID DESC LIMIT 9";
		ArrayList<Write> list = new ArrayList<Write>();
		try {
			int nextID = getNext(); // 다음 게시글의 ID 값을 저장
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, nextID - (pageNumber - 1) * 9);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Write writePost = new Write();
				writePost.setId(rs.getInt(1));
				writePost.setTitle(rs.getString(2));
				writePost.setAuthor(rs.getString(3));
				writePost.setContent(rs.getString(4));
				writePost.setCodeContent(rs.getString(5));
				writePost.setLang(rs.getString(6));
				list.add(writePost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM WRITE WHERE ID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 9);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Write getWrite(int ID) {
		String SQL = "SELECT * FROM WRITE WHERE ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Write writePost = new Write();
				writePost.setId(rs.getInt(1));
				writePost.setTitle(rs.getString(2));
				writePost.setAuthor(rs.getString(3));
				writePost.setContent(rs.getString(4));
				writePost.setCodeContent(rs.getString(5));
				writePost.setLang(rs.getString(6));
				return writePost;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int id, String title, String content, String codeContent, String lang) {
		String SQL = "UPDATE WRITE SET title = ?, content = ?, codeContent = ?, lang = ? WHERE id = ?";
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, title);
	        pstmt.setString(2, content);
	        pstmt.setString(3, codeContent);
	        pstmt.setString(4, lang);
	        pstmt.setInt(5, id);
	        return pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; //데이터베이스 오류
	}
	
	public int delete(int id) {
	    String SQL = "DELETE FROM WRITE WHERE id = ?";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setInt(1, id);
	        return pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; // 데이터베이스 오류
	}

	
}

