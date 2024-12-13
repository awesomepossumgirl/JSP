package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {
	// MySQL 접속하기
	private Connection conn;
	private ResultSet rs;

	// 생성자 만들기
	public BbsDAO() {
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

	// 현재 시간을 가져오는 메서드
	// 게시판에 글 작성할 때 현재 서버의 시간을 가져옴
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			rs = psmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	// 글번호를 가져오는 메서드
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID desc";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			rs = psmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 실제로 글 작성하는 메서드
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, getNext());
			psmt.setString(2, bbsTitle);
			psmt.setString(3, userID);
			psmt.setString(4, getDate());
			psmt.setString(5, bbsContent);
			psmt.setInt(6, 1);
			/*
			 * insert는 executeUpdate임, executeQuery는 select rs = psmt.executeQuery();
			 */
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 특정한 페이지에 맞는 게시글 리스트가 list에 담겨 반환
	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<>();
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = psmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, bbsID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 명시적으로 리소스를 닫기
			try {
				if (rs != null) {
					rs.close();
				}
				if (psmt != null) {
					psmt.close();
				}
				if (conn != null && !conn.isClosed()) {
					conn.close(); // 연결 닫기
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	// 글수정 기능
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, bbsTitle);
			psmt.setString(2, bbsContent);
			psmt.setInt(3, bbsID);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if (psmt != null) {
		            try {
		                psmt.close();
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		}
		return -1; // 데이터베이스 오류
	}
	
	// 글삭제 기능
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, bbsID);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if (psmt != null) {
		            try {
		                psmt.close();
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		}
		return -1; // 데이터베이스 오류	
	}
}                         
