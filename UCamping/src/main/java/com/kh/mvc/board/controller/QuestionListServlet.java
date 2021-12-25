package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.QuestionService;
import com.kh.mvc.board.model.vo.QuestionBoard;
import com.kh.mvc.common.util.PageInfo;

@WebServlet("/question")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private QuestionService service = new QuestionService();
       
    public QuestionListServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 게시글 리스트 조회
		// 2. 페이징 처리
		int page=0;
		int listCount = 0;
		PageInfo pageInfo=null;
		List<QuestionBoard> list = null;
		
		page=request.getParameter("page")!=null? Integer.parseInt(request.getParameter("page")) : 1;

		listCount= service.getQBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list=service.getQBoardList(pageInfo);
		
		

		
		// ﻿﻿request 객체를 가져와서 데이터를 setAttribute()에 담아서 foward로 notice.jsp에 넘겨준다.
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/question.jsp").forward(request, response);
	}

}
