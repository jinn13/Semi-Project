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

	public int wish(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateWishStatus(connection, no, "Y");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);		
		
		return result;
	}


	public SaleBoard findSaleBoardNo (int no) {
		SaleBoard saleboard = null;
		Connection connection = getConnection();
		
		
		System.out.println("dao한테 넘기기전 no"+no);
		saleboard = dao.findSaleBoardNo(connection, no);
		System.out.println("서비스단에 잘 불려워지나 체크중 : "+saleboard);
		close(connection);
		
		return saleboard;
	}

}