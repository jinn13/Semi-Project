package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.QuestionService;
import com.kh.mvc.board.model.vo.QuestionBoard;

@WebServlet("/question/view")
public class QuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private QuestionService service = new QuestionService();
	
    public QuestionViewServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 숫자타입으로 넣어주기
		int otoNo = Integer.parseInt(request.getParameter("no"));
		
//		System.out.println("사용자에게 받은 no값 : " + otoNo);
		
		QuestionBoard qBoard = service.findQBoardByNo(otoNo);
		
		System.out.println("여긴 Q뷰서블릿임 - qBoard객체 : " + qBoard);
		
		request.setAttribute("question", qBoard);
		
		request.getRequestDispatcher("/views/board/questionView.jsp").forward(request, response);
	}

}
