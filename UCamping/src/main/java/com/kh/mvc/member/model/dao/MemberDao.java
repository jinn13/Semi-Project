package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import com.kh.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String id) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
		
		try {
			
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				
				
				member = new Member();
				
				member.setNo(rs.getInt("NO"));
				member.setId(rs.getString("ID"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setRole(rs.getString("ROLE"));
				member.setName(rs.getString("NAME"));
				member.setBirth(rs.getString("BIRTH"));
				member.setNickname(rs.getString("NICKNAME"));
				member.setEmail(rs.getString("EMAIL"));
				member.setPhone(rs.getString("PHONE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setStatus(rs.getString("STATUS"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				member.setModifyDate(rs.getDate("MODIFY_DATE"));
		
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			
		}
		
		return member;
	}

	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getNickname());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET NICKNAME=?,NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getNickname());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.setInt(6, member.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public Member findId(Connection conn, String userName, String userPhone) {
		Member member = null;
		PreparedStatement  pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE NAME=? AND PHONE=?";
		
		try {
			pstm = conn.prepareStatement(query);
			
			// ?(위치홀더) 만들어서 쿼리문 수행 전에 id로 세팅해둠
			pstm.setString(1, userName);
			pstm.setString(2, userPhone);
			
			// 쿼리문 실행 후 그 결과값을 resultset으로 리턴해주는 역할
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				member= new Member();
				member.setNo(rs.getInt("NO"));
				member.setId(rs.getString("ID"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setRole(rs.getString("ROLE"));
				member.setName(rs.getString("NAME"));
				member.setBirth(rs.getString("BIRTH"));
				member.setNickname(rs.getString("NICKNAME"));
				member.setEmail(rs.getString("EMAIL"));
				member.setPhone(rs.getString("PHONE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setStatus(rs.getString("STATUS"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				member.setModifyDate(rs.getDate("MODIFY_DATE"));
				
				// 컬럼라벨을 줘도 되고, 순번을 줘도 된다.  
				System.out.println("ID : "+rs.getString("ID")+", password : "+rs.getString("PASSWORD")+", NAME : "+rs.getString("NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);	
		}
		
		return member;
	}
	
	
	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET STATUS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateMemberPassword(Connection connection, int no, String password) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET PASSWORD=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(2, no);
			pstmt.setString(1, password);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	

	public Member findPw(Connection conn, String userId, String userName, String userPhone) {
		
		
		
		return null;
	}

}
