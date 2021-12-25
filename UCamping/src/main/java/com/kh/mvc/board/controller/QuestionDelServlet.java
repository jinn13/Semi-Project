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
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/question/delete")
public class QuestionDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private QuestionService service=new QuestionService();
//    private MemberService mservice=new MemberService();
    
    public QuestionDelServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result=0;    	
    	int no= Integer.parseInt(request.getParameter("no"));
    	
    	// 로그인체크
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	// 로그인을 했다면 본인 게시글인지 확인
    	if(loginMember != null) {
    		// 1. 로그인 한 유저의 id를 가져온다. 
        	String loginId=loginMember.getId();
        	// 2. 해당 게시물을 작성한 유저의 id를 가져온다. 
        	QuestionBoard board=service.findQBoardByNo(no);
        	String isYou=board.getWriterId();
    		
        	// id 잘 가져왔는지 확인중
        	// System.out.println(loginId+", "+isYou);
        	
        	// 3. 로그인한 유저의 id와 작성자 id를 비교해서 true면 삭제한다. 
    		if(loginId.equals(isYou)) {
    			result=service.delete(no);    			
    		}
    	
    		if(result>0) {
        		request.setAttribute("msg", "1:1문의글을 삭제하셨습니다.");
        		request.setAttribute("location", "/question");
    		}else {
    			// 해당 게시글 작성자가 아닌경우 다시 리스트로 보낸다. 
        		request.setAttribute("msg", "본인이 작성한 글만 삭제 가능합니다.");
        		request.setAttribute("location", "/question");
    		}
    		
    	// 로그인한 유저가 아니면 접근 불가능함	
    	}else {
    		request.setAttribute("msg", "접근에 실패하셨습니다.");
    		request.setAttribute("location", "/");
    		
    	}	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

}
}
