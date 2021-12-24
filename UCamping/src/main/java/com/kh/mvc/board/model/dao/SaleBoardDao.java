
package com.kh.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.board.model.vo.SaleBoard;
import com.kh.mvc.common.util.PageInfo;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class SaleBoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM SALEBOARD WHERE STATUS='Y'";
		
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

	public List<SaleBoard> findAll(Connection connection, PageInfo pageInfo) {
		List<SaleBoard> salelist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RNUM, SALE_WRITER_NO, SALE_TITLE, ID, SALE_CONTENT, SALE_FILENAME, SALE_PRICE"
				+ " FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "SALE_WRITER_NO, "
				+ 			"SALE_TITLE, "
				+ 			"ID, "
				+ 			"SALE_CONTENT, "
				+ 			"SALE_FILENAME, "
				+  			"SALE_PRICE "
				+ 	 "FROM ("
				+ 	    "SELECT S.SALE_WRITER_NO, "
				+ 			   "S.SALE_TITLE, "
				+  			   "M.ID, "
				+ 			   "S.SALE_CONTENT, "
				+ 			   "S.SALE_FILENAME, "
				+ 			   "S.SALE_PRICE "
				+ 		"FROM SALEBOARD S "
				+ 		"JOIN MEMBER M ON(S.SALE_WRITER_NO = M.NO) "
				+ 		"WHERE S.STATUS = 'Y' ORDER BY S.SALE_NO DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SaleBoard saleboard = new SaleBoard();
				
				saleboard.setWriterNo(rs.getInt("SALE_WRITER_NO"));
				saleboard.setRowNum(rs.getInt("RNUM"));
				saleboard.setWriterId(rs.getString("ID"));
				saleboard.setTitle(rs.getString("SALE_TITLE"));
				saleboard.setContent(rs.getString("SALE_CONTENT"));
				saleboard.setFileName(rs.getString("SALE_FILENAME"));
				saleboard.setPrice(rs.getString("SALE_PRICE"));
				System.out.println(saleboard);
				
				salelist.add(saleboard);																							
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return salelist;
	}
	
	public int insertBoard(Connection connection, SaleBoard saleboard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO SALEBOARD VALUES(SEQ_SALEBOARD_NO.NEXTVAL,?,?,?,?,?,?,DEFAULT,DEFAULT,?,?,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, saleboard.getWriterNo());
			pstmt.setString(2, saleboard.getTitle());	
			pstmt.setString(3, saleboard.getPrice());
			pstmt.setString(4, saleboard.getCategory());
			pstmt.setString(5, saleboard.getContent());
			pstmt.setString(6, saleboard.getFileName());
			pstmt.setString(7, saleboard.getGoodsStatus());
			pstmt.setString(8, saleboard.getDealStatus());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int updateBoard(Connection connection, SaleBoard saleboard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE SALEBOARD SET SALE_TITLE=?,SALE_PRICE=?,SALE_CONTENT=?,SALE_FILENAME=?,GOODS_STATUS=?,DEAL_STATUS=?,SALE_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, saleboard.getTitle());
			pstmt.setString(2, saleboard.getPrice());
			pstmt.setString(3, saleboard.getContent());
			pstmt.setString(4, saleboard.getFileName());
			pstmt.setString(5, saleboard.getGoodsStatus());
			pstmt.setString(6, saleboard.getDealStatus());
			pstmt.setInt(7, saleboard.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}

	
