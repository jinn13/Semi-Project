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
	
	

}
