package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.NoticeService;
import com.kh.mvc.board.model.vo.Notice;
import com.kh.mvc.common.util.PageInfo;


@WebServlet("/notice")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();

    public NoticeServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 게시글 리스트 조회
		// 2. 페이징 처리
		int page=0;
		int listCount = 0;
		PageInfo pageInfo=null;
		List<Notice> list = null;
		

		page=request.getParameter("page")!=null? Integer.parseInt(request.getParameter("page")) : 1;


		listCount= service.getNoticeCount();
//		System.out.println("서블릿에서 찍은 값"+listCount);
//		pageInfo = new PageInfo(page, 0, 0, 0);
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list=service.getNoticeList(pageInfo);
		
//		System.out.println("서블릿에서 찍음 총 페이지:"+listCount);
//		System.out.println("pageInfo 찍어봄 : "+pageInfo);
//		System.out.println("이전페이지"+pageInfo.getPrevePage());
		
//		System.out.println(listCount);
//		System.out.println(list);
		
		// ﻿﻿request 객체를 가져와서 데이터를 setAttribute()에 담아서 foward로 notice.jsp에 넘겨준다.
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/notice.jsp").forward(request, response);
	}

}
