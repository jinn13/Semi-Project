package com.kh.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import com.kh.mvc.board.model.vo.Notice;
import com.kh.mvc.common.util.PageInfo;

public class NoticeDao {

	public int insertNotice(Connection connection, Notice notice) {
		int result=0;
		PreparedStatement pstmt = null;
		String query="INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstmt=connection.prepareStatement(query);
			pstmt.setInt(1, notice.getWriterNo());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());

			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

	public int getNoticeCount(Connection connection) {
		// 1. 기본적으로 필요한 애들 생성
		int count = 0;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String query="SELECT COUNT(*) FROM NOTICE WHERE STATUS='Y'";
		
		try {
			// 2. connection에서 prepareStatment(query) 얻어옴
			// 3. 예외처리 try/catch로 감싸줌
			pstmt=connection.prepareStatement(query);
			// 4. resultset으로 반환해주는 execeteQuery실행, rs에 값 담기.
			rs=pstmt.executeQuery();
			// 5. next하면 첫번째 행 가리킴, 거기서 getXXX(컬럼명 or 컬럼순번)으로 값 가져옴
			if(rs.next()) {
				count=rs.getInt(1);
				// System.out.println(count);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			// 6. 역순으로 close해줌. 
			close(rs);
			close(pstmt);			
		}
		return count;

	}

	public List<Notice> findAll(Connection connection, PageInfo pageInfo) {
		List<Notice> list=new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query=
				                                                  // STATUS 옆에 공백 하나 있어야 함.
				"SELECT RNUM, NOTICE_NO, NOTICE_TITLE, ID, CREATE_DATE, READCOUNT, STATUS "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "NOTICE_NO, "
				+ 			"NOTICE_TITLE, "
				+ 			"ID, "
				+ 			"CREATE_DATE, "
				+  			"READCOUNT, "
				+     		"STATUS "
				+ 	 "FROM ("
				+ 	    "SELECT N.NOTICE_NO, "
				+ 			   "N.NOTICE_TITLE, "
				+  			   "M.ID, "
				+ 			   "N.CREATE_DATE, "
				+ 			   "N.READCOUNT, "
				+ 	   		   "N.STATUS "
				+ 		"FROM NOTICE N "
				+ 		"JOIN MEMBER M ON(N.WRITER_NO = M.NO) "
				+ 		"WHERE N.STATUS = 'Y' ORDER BY N.NOTICE_NO DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
				
		try {
			pstmt=connection.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Notice notice=new Notice();
				
				notice.setNo(rs.getInt("NOTICE_NO"));
				notice.setRowNum(rs.getInt("RNUM"));
				notice.setWriterId(rs.getString("ID"));
				notice.setTitle(rs.getString("NOTICE_TITLE"));
				notice.setCreateDate(rs.getDate("CREATE_DATE"));
				notice.setReadCount(rs.getInt("READCOUNT"));
				notice.setStatus(rs.getString("STATUS"));
				
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);		
		}
		return list;
	}

	public Notice findNoticeByNo(Connection connection, int no) {
		// 1. 보드값 리턴하게 만들어준다.(그 외 필요한 객체들 생성) 
		Notice notice = null;
		PreparedStatement pstmt = null; // 위치홀더 사용하기 위한 pstmt
		ResultSet rs = null;   			// select문은 결과가 resultset임
		// 2. 쿼리문 넣어주기
		String query= // 줄마다 끝에 꼭 공백들어갔는지 확인()
	            "SELECT "
	            +    "N.NOTICE_NO, "
	            +   "N.NOTICE_TITLE, "
	            +   "M.ID, "
	            +   "N.READCOUNT, "
	            +   "N.NOTICE_CONTENT, "
	            +   "N.CREATE_DATE, "
	            +   "N.MODIFY_DATE "
	            + "FROM NOTICE N "
	            + "JOIN MEMBER M ON(N.WRITER_NO = M.NO) "
	            + "WHERE N.STATUS = 'Y' AND N.NOTICE_NO=?";
		
		try {
			// 3. connection객체에서 query를 통해 pstmt얻어오기
			pstmt=connection.prepareStatement(query);
			// 4. 쿼리문 마지막의 위치홀더 값 설정
			pstmt.setInt(1, no);
			
			// 5. 쿼리문 실행시켜서 rs에 담아준다. 
			rs=pstmt.executeQuery();
			
			// rs.next가 true면..(실제 데이터를 가리킨다면)
			if(rs.next()) {
				// 6. board객체 하나 만들어주고
				notice = new Notice();
				
				// 7. 조회된 하나의 행의 값을 자바에서 쓸수있도록 board객체만들고 거기에 데이터 set해준다.  
				notice.setNo(rs.getInt("NOTICE_NO")); // 받아온 no도 되고 쿼리로 받아온 NO도 된다. 
				notice.setTitle(rs.getString("NOTICE_TITLE")); // 괄호안엔 쿼리문의 이름 가져오기
				notice.setWriterId(rs.getString("ID"));
				notice.setReadCount(rs.getInt("READCOUNT"));
				notice.setContent(rs.getString("NOTICE_CONTENT"));
				notice.setCreateDate(rs.getDate("CREATE_DATE"));
				notice.setModifyDate(rs.getDate("MODIFY_DATE"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs); 
			close(pstmt);

		}
		return notice;
	}

	public int updateStatus(Connection connection, int no, String status) {
		// 1. update이니 정수값으로 결과
		int result=0;
		// 2. 쿼리문 실행시킬 pstmt.. 
		PreparedStatement pstmt=null;
		// 3. 쿼리문까지 만들면 기본적인 준비 끝. 
		String query="UPDATE NOTICE SET STATUS=? WHERE NOTICE_NO=?";
		
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

	public int updateNotice(Connection connection, Notice notice) {
		int result=0;
		PreparedStatement pstmt=null;
		String query="UPDATE NOTICE SET NOTICE_TITLE=?,NOTICE_CONTENT=?,MODIFY_DATE=SYSDATE WHERE NOTICE_NO=?";
//		System.out.println("여기까진 데이터 잘 오나 확인중");
		try {
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setInt(3, notice.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
}
