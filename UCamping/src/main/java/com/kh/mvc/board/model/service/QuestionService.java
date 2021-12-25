package com.kh.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.QBoardDao;
import com.kh.mvc.board.model.vo.QuestionBoard;
import com.kh.mvc.common.util.PageInfo;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class QuestionService {
	
	private QBoardDao dao = new QBoardDao();
	
	public int getQBoardCount() {
		int count = 0;
		
		Connection connection = getConnection();
		
		count = dao.getQBoardCount(connection);
		
		close(connection);
		
		
		return count;
	}
	
	public QuestionBoard findQBoardByNo(int otoNo) {
		QuestionBoard qBoard = null;
		Connection connection = getConnection();
		
		qBoard = dao.findQBoardByNo(connection, otoNo);
		
		close(connection);
		
		return qBoard;
		
	}
	
	
	public int save(QuestionBoard qBoard) {
		int result = 0;
		Connection connection = getConnection();
		
		if(qBoard.getOtoNo() != 0) {
			result = dao.updateQBoard(connection, qBoard);
//			System.out.println("업에이트 되었나?(여긴서비스임) : "+result);
		} else {
			result = dao.insertQBoard(connection, qBoard);
		}
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		return result;
	}

	public List<QuestionBoard> getQBoardList(PageInfo pageInfo) {
		List<QuestionBoard> list = null;
		Connection connection = getConnection();
		list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public int delete(int no) {
		// Delete이니 결과값은 정수값
		int result=0;
		// 커넥션 필요(클로즈도 잊지말고 마지막에 적어주자)
		Connection connection=getConnection();
		
		// dao한테 상태값만 바꾸라고 시키고 결과값 받기
		result=dao.updateStatus(connection, no, "N");
		
		// 상태값 바꾸는데 성공 또는 실패하면 커밋or롤백하기 
		if(result>0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;

	}
	
	

}
