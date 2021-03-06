package com.kh.mvc.member.model.service;

import java.sql.Connection;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();


	
	public Member isDuplicate(String userName, String userPhone) {
		Member result=null;
		Connection conn= getConnection();
		Member member=dao.findId(conn, userName, userPhone);
		
		if(member!=null) {
			result=member;
		}else{
			result=null;
		}
		
		close(conn);
		
		return result;
	}
	
	public boolean isDuplicateId(String id) {
		Connection connection = getConnection();	
		Member member = dao.findMemberById(connection, id);
		
		close(connection);		
		
		return this.findMemberById(id) != null;
	}


	
	public Member login(String id, String password) {
		Connection connection = getConnection();	
		Member member = dao.findMemberById(connection, id);
		
		close(connection);
		
		if(member != null && member.getPassword().equals(password)) {
			return member;			
		} else {
			return null;
		}
	}

	public Member sns_login(String id, String email) {
		Connection connection = getConnection();	
		Member member = dao.findMemberById(connection, id);
		
		close(connection);
		
		if(member != null && member.getEmail().equals(email)) {
			return member;			
		} else {
			return null;
		}
	}
	

	public int save(Member member) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if(member.getNo() != 0) {
			result = dao.updateMember(connection, member);
		} else {
			result = dao.insertMember(connection, member);			
		}
		
		
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int delete(int no) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = dao.updateMemberStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}
	
	public int updatePassword(int no, String password) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = dao.updateMemberPassword(connection, no, password);
		
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	


	public Member findMemberById(String id) {
		Connection connection = getConnection();	
		Member member = dao.findMemberById(connection, id);
		
		close(connection);
		
		return member;
	}

	public Member isMember(String userId, String userName, String userPhone) {
		Member result=null;
		Connection conn= getConnection();
		Member member=dao.findPw(conn, userId, userName, userPhone);
		
		if(member!=null) {
			result=member;
		}else{
			result=null;
		}
		
		close(conn);
		
		return result;
	}

}
