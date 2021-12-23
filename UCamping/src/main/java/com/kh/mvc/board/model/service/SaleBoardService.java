package com.kh.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.SaleBoardDao;
import com.kh.mvc.board.model.vo.SaleBoard;
import com.kh.mvc.common.util.PageInfo;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class SaleBoardService {

	private SaleBoardDao dao = new SaleBoardDao();

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = dao.getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<SaleBoard> getBoardList(PageInfo pageInfo) {
		List<SaleBoard> salelist = null;
		Connection connection = getConnection();
		
		salelist = dao.findAll(connection, pageInfo);
		
		
		close(connection);
		return salelist;
	}

	public int save(SaleBoard saleboard) {
		int result = 0;
		Connection connection = getConnection();
		
		if (saleboard.getNo() != 0 ) {
			result = dao.updateBoard(connection, saleboard);
		} else {
			result = dao.insertBoard(connection, saleboard);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);		
		
		return result;
	}
}