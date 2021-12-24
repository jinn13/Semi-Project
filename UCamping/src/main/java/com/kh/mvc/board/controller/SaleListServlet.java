package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.SaleBoardService;
import com.kh.mvc.board.model.vo.SaleBoard;
import com.kh.mvc.common.util.PageInfo;


@WebServlet("/saleboard/salelist")
public class SaleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private SaleBoardService service = new SaleBoardService();
	
    public SaleListServlet() {
    	
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 판매 게시글 리스트 조회
    	// 2. 페이징 처리
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<SaleBoard> salelist = null;
    	
    	try {
    	page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
    	}
    	
    	listCount = service.getBoardCount();
    	pageInfo = new PageInfo(page, 10, listCount, 6);
    	salelist = service.getBoardList(pageInfo);
    	
    	System.out.println(listCount);
    	System.out.println(salelist);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("salelist", salelist);
    	request.getRequestDispatcher("/views/transaction/buygoods.jsp").forward(request, response);
	}

}
