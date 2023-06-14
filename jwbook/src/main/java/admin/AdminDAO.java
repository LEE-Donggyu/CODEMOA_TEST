package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;
import java.sql.ResultSet;


public class AdminDAO {
    private Connection conn;
    private PreparedStatement pstmt;

    public AdminDAO() {
        try {
            String dbURL = "jdbc:h2:tcp://localhost/~/jwbookdb";
            String dbID = "jwbook";
            String dbPW = "1234";
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int saveReportedWrite(int writeID, String content) {
        String SQL = "INSERT INTO admin(writeID, content) VALUES (?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, writeID);
            pstmt.setString(2, content);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // DB error
    }

    public int saveReportedComment(int writeID, String commentID, String commentContent) {
        String SQL = "INSERT INTO admin(writeID, commentID, commentContent) VALUES (?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, writeID);
            pstmt.setString(2, commentID);
            pstmt.setString(3, commentContent);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // DB error
    }
    
    public ArrayList<Admin> getList() {
        ArrayList<Admin> list = new ArrayList<>();
        String SQL = "SELECT * FROM admin ORDER BY reportID ASC";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setWriteID(rs.getInt("writeID"));
                admin.setContent(rs.getString("content"));
                admin.setCommentID(rs.getString("commentID"));
                admin.setCommentContent(rs.getString("commentContent"));
                admin.setReportID(rs.getInt("reportID"));
                list.add(admin);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
