package com.kh.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.board.model.vo.QuestionBoard;
import com.kh.mvc.common.util.PageInfo;

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
		String query = "INSERT INTO QBOARD VALUES(SEQ_QBOARD_NO.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT)";
		
		System.out.println(qBoard);
		
		try {
			pstmt = connection.prepareStatement(query);
		
			pstmt.setInt(1, qBoard.getWriterNo());
			pstmt.setString(2, qBoard.getOtoTitle());
			pstmt.setString(3, qBoard.getOtoContent());
			pstmt.setString(4, qBoard.getOtoFilename());
			
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
		String query = "UPDATE QBOARD SET OTO_TITLE=?,OTO_CONTENT=?,OTO_FILENAME=?,OTO_DATE=SYSDATE WHERE OTO_NO=?";
		
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
		QuestionBoard qBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
                +   "Q.OTO_NO, "
                +   "Q.OTO_TITLE, "
                +   "M.ID, "		
                +   "Q.OTO_FILENAME, "
                +   "Q.OTO_CONTENT, "
                +   "Q.OTO_DATE "
                + "FROM QBOARD Q "
                + "JOIN MEMBER M ON(Q.OTO_WRITER_NO = M.NO) "
                + "WHERE Q.STATUS = 'Y' AND Q.OTO_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			// 쿼리문 마지막 위치홀더 값
			pstmt.setInt(1, otoNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				qBoard = new QuestionBoard();
				
				qBoard.setOtoNo(rs.getInt("OTO_NO"));
				qBoard.setOtoNo(rs.getInt("OTO_WRITER_NO"));
				qBoard.setOtoTitle(rs.getString("OTO_TITLE"));
				qBoard.setOtoFilename(rs.getString("OTO_FILENAME"));
				qBoard.setOtoContent(rs.getString("OTO_CONTENT"));
				qBoard.setOtoDate(rs.getDate("OTO_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
			
		return qBoard;
	}


	public List<QuestionBoard> findAll(Connection connection, PageInfo pageInfo) {
		List<QuestionBoard> list=new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =
				"SELECT RNUM, OTO_NO, OTO_TITLE, ID, OTO_DATE, OTO_FILENAME, STATUS "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "OTO_NO, "
						+ 			"OTO_TITLE, "
						+ 			"ID, "
						+ 			"OTO_DATE, "
						+  			"OTO_FILENAME, "
						+     		"STATUS "
						+ 	 "FROM ("
						+ 	    "SELECT Q.OTO_NO, "
						+ 			   "Q.OTO_TITLE, "
						+  			   "M.ID, "
						+ 			   "Q.OTO_DATE, "
						+ 	   		   "Q.OTO_FILENAME, "
						+ 	   		   "Q.STATUS "
						+ 		"FROM QBOARD Q "
						+ 		"JOIN MEMBER M ON(Q.OTO_WRITER_NO = M.NO) "
						+ 		"WHERE Q.STATUS = 'Y' ORDER BY Q.OTO_NO DESC"
						+ 	 ")"
						+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs=pstmt.executeQuery();
		
			while(rs.next()){
				QuestionBoard qboard = new QuestionBoard();
				
				qboard.setOtoNo(rs.getInt("OTO_NO"));
				qboard.setOtoTitle(rs.getString("OTO_TITLE"));
				qboard.setOtoDate(rs.getDate("OTO_DATE"));
				qboard.setOtoStatus(rs.getString("STATUS"));
				
				list.add(qboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);	
		}
		return list;
	}


}
