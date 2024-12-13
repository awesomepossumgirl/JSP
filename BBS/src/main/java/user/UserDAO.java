package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	// MySQL 접속하기
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	// 생성자 만들기
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "@cholda8291";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인 처리 로직
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; // 로그인 성공
				 else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}
	
	// 회원가입 처리 로직
    public int join(User user) {
    	String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
    	try  {
    		psmt = conn.prepareStatement(SQL);
    		psmt.setString(1, user.getUserID());
    		psmt.setString(2, user.getUserPassword());
    		psmt.setString(3, user.getUserName());
    		psmt.setString(4, user.getUserGender());
    		psmt.setString(5, user.getUserEmail());
    		return psmt.executeUpdate();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return -1; // DB오류
    	// INSERT 쿼리 실행하면 0 이상 반환하므로 -1이 아닌 경우에 성공적으로 회원가입 된 것!
    }
    
}
            