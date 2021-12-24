package com.kh.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.board.model.vo.QuestionBoard;
import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class QBoardDao {
	
	public int getQBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM QBOARD WHERE STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
		
	}
	
	
		public int insertQBoard(Connection connection, QuestionBoard qBoard) {
		int result = 0;		
		PreparedStatement pstmt = null;
		String query = "INSERT INTO QBOARD VALUES(SEQ_QBOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
		
			pstmt.setInt(1, qBoard.getUserNum());
			pstmt.setString(2, qBoard.getOtoPwd());
			pstmt.setString(3, qBoard.getOtoTitle());
			pstmt.setString(4, qBoard.getOtoContent());
			pstmt.setString(5, qBoard.getOtoFilename());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public int updateQBoard(Connection connection, QuestionBoard qBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE QBOARD SET OTO_TITLE=?,OTO_CONTENT=?,OTO_FILENAME=?,OTO_DATE=SYSDATE WHERE OTO_NUM=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, qBoard.getOtoTitle());
			pstmt.setString(2, qBoard.getOtoContent());
			pstmt.setString(3, qBoard.getOtoFilename());
			pstmt.setDate(4, qBoard.getOtoDate());
			pstmt.setInt(5, qBoard.getOtoNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public QuestionBoard findQBoardByNo(Connection connection, int otoNo) {

		return null;
	}

}
