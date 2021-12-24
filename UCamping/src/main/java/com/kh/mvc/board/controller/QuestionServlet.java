package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.vo.Member;

// 로그인하고 1:1문의 등록 게시판으로 이동하는 서블릿
@WebServlet("/question")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    public QuestionServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =  request.getSession(false);
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
    		
    		request.getRequestDispatcher("/views/board/question.jsp").forward(request, response);    		
    	} else {
    		request.setAttribute("msg", "로그인 후 1:1 문의를 등록 할 수 있습니다.");
    		request.setAttribute("location", "/");
    		
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);    			
    	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
