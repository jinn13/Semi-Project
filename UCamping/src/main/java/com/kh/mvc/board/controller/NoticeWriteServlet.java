package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.NoticeService;
import com.kh.mvc.board.model.vo.Notice;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/admin/notice/write")
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();
       

    public NoticeWriteServlet() {
    }

    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// 로그인 했는지 여부 체크
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	String viewName="/views/board/noticeUpdate.jsp";                 
    	
    	if(loginMember == null) {                                // 만약 로그인이 안되었다면
    		viewName="/views/common/msg.jsp";                    // viewName을 msg.jsp로 바꾸고
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");         // 메세지 보내주고
    		request.setAttribute("location", "/");                               // location 바꿔주고
    	}

    	
    	
    	request.getRequestDispatcher(viewName).forward(request, response);
		//request.getRequestDispatcher("/views/board/noticeUpdate.jsp").forward(request, response);
	}

    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result=0;

    	
    	String title = request.getParameter("title");
    	String writer = request.getParameter("writer");
    	String content = request.getParameter("content");
    	// 내용의 경우 엔터, 개행은 <br>로 대체하는 코드
    	content=content.replace("\r\n","<br>");
    	
    	System.out.println("제목 : "+title);
    	System.out.println("글쓴이 : "+writer);
    	System.out.println("내용 : "+content);
    	
    	
    	// 로그인 안된 사용자가 게시글 작성이 불가능하도록 체크하는 로직
    	 HttpSession session = request.getSession(false);
    	 Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	 
     	if(loginMember != null) {
    		Notice notice = new Notice();
    		
    		notice.setWriterNo(loginMember.getNo());
    		notice.setTitle(title);
    		notice.setContent(content);

    		
    		result = service.save(notice);   
    		
    		if(result>0) {
    			// 게시글 등록 성공
        		request.setAttribute("msg", "게시글 등록 성공!");
        		request.setAttribute("location", "/notice");
    		}else {
    			// 게시글 등록 실패
        		request.setAttribute("msg", "게시글 등록 실패!");
        		request.setAttribute("location", "/notice");
    		}
    		
    	}else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/");
    		
    	}	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);


	}

}
