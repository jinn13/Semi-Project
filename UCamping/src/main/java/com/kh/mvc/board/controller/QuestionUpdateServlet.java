package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.QuestionService;
import com.kh.mvc.board.model.vo.QuestionBoard;
import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/board/questionUpdate")
public class QuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private QuestionService service = new QuestionService();
      
    public QuestionUpdateServlet() {    
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	String viewName = "/views/board/questionView.jsp";
    	
    	if(loginMember == null) {    
    		viewName = "/views/common/msg.jsp";
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher(viewName).forward(request, response);
    	
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
		
		String QFilePath = getServletContext().getRealPath("/resources/upload");
		
		int maxSize = 10485760;
		
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, QFilePath, maxSize, encoding, new FileRename()); 
		
		String otoTitle = mr.getParameter("title");
		String otoWriter = mr.getParameter("writer");
		String otoPwd = mr.getParameter("password");
		String otoFile = mr.getFilesystemName("upfile");
		String otoContent = mr.getParameter("content");
		
		// 로그인 확인
		HttpSession session  = request.getSession(false); 
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
		
		if(loginMember != null) {
			QuestionBoard qBoard = new QuestionBoard();
    		
    		qBoard.setOtoTitle(otoTitle);
    		qBoard.setUserNum(loginMember.getNo());
    		qBoard.setOtoPwd(otoPwd);
    		qBoard.setOtoContent(otoContent);
    		qBoard.setOtoFilename(otoFile);
    		
    		result = service.save(qBoard);
    		
    		if(result > 0) {
        		request.setAttribute("msg", "1:1 문의 등록 성공");
    			request.setAttribute("location", "/board/question");
    			
        	}else {
        		request.setAttribute("msg", "1:1 문의 등록 실패!");
    			request.setAttribute("location", "/board/question");
        	}
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
			
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
    	
    }

}
