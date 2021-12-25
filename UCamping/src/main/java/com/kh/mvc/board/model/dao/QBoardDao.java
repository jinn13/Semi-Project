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
		String query = "INSERT INTO QBOARD VALUES(SEQ_QBOARD_NO.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT,?)";
		
		System.out.println(qBoard);
		
		try {
			pstmt = connection.prepareStatement(query);
		
			pstmt.setInt(1, qBoard.getWriterNo());
			pstmt.setString(2, qBoard.getOtoTitle());
			pstmt.setString(3, qBoard.getOtoContent());
			pstmt.setString(4, qBoard.getOtoFilename());
			pstmt.setString(5, qBoard.getRenamedFileName());
			
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
		String query = "UPDATE QBOARD SET OTO_TITLE=?,OTO_CONTENT=?,OTO_FILENAME=?,RENAMED_FILENAME=? WHERE OTO_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, qBoard.getOtoTitle());
			pstmt.setString(2, qBoard.getOtoContent());
			pstmt.setString(3, qBoard.getOtoFilename());
			pstmt.setString(4, qBoard.getRenamedFileName());
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
		// 1. 보드값 리턴하게 만들어준다.(그 외 필요한 객체들 생성) 
		QuestionBoard board = null;
		PreparedStatement pstmt = null; // 위치홀더 사용하기 위한 pstmt
		ResultSet rs = null;   			// select문은 결과가 resultset임
		// 2. 쿼리문 넣어주기
		String query= // 줄마다 끝에 꼭 공백들어갔는지 확인()
	            "SELECT "
	            +    "Q.OTO_NO, "
	            +   "Q.OTO_TITLE, "
	            +   "M.ID, "
	            +   "Q.OTO_FILENAME, "
	            +   "Q.OTO_CONTENT, "
	            +   "Q.RENAMED_FILENAME, "
	            +   "Q.OTO_DATE "
	            + "FROM QBOARD Q "
	            + "JOIN MEMBER M ON(Q.OTO_WRITER_NO = M.NO) "
	            + "WHERE Q.STATUS = 'Y' AND Q.OTO_NO=?";
		
		try {
			// 3. connection객체에서 query를 통해 pstmt얻어오기
			pstmt=connection.prepareStatement(query);
			// 4. 쿼리문 마지막의 위치홀더 값 설정
			pstmt.setInt(1, otoNo);
			
			// 5. 쿼리문 실행시켜서 rs에 담아준다. 
			rs=pstmt.executeQuery();
			
			// rs.next가 true면..(실제 데이터를 가리킨다면)
			if(rs.next()) {
				// 6. board객체 하나 만들어주고
				board = new QuestionBoard();
				
				// 7. 조회된 하나의 행의 값을 자바에서 쓸수있도록 board객체만들고 거기에 데이터 set해준다.  
				board.setOtoNo(rs.getInt("OTO_NO")); // 받아온 no도 되고 쿼리로 받아온 NO도 된다. 
				board.setOtoTitle(rs.getString("OTO_TITLE")); // 괄호안엔 쿼리문의 이름 가져오기
				board.setWriterId(rs.getString("ID"));
				board.setOtoFilename(rs.getString("OTO_FILENAME"));
				board.setOtoContent(rs.getString("OTO_CONTENT"));
				board.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				board.setOtoDate(rs.getDate("OTO_DATE"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs); //rs가 마지막에 생겼으니 가장먼저 닫기
			close(pstmt);
			// DAO에서는 connection 안닫아줘도 된다.(서비스에서 닫음) 
		}
		return board;
		
		
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
				qboard.setWriterId(rs.getString("ID"));
				qboard.setRowNum(rs.getInt("RNUM"));
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


	public int updateStatus(Connection connection, int no, String status) {
		// 1. update이니 정수값으로 결과
		int result=0;
		// 2. 쿼리문 실행시킬 pstmt.. 
		PreparedStatement pstmt=null;
		// 3. 쿼리문까지 만들면 기본적인 준비 끝. 
		String query="UPDATE QBOARD SET STATUS=? WHERE OTO_NO=?";
		
		
		try {
			// 4. connection객체에서 퀴리문 주면 pstm얻어옴(예외처리하기)
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			// 6. update나 insert등등은 executeUpdate임(selet는 executeQuery임)
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
}
