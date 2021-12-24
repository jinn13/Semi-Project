package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.NoticeService;
import com.kh.mvc.board.model.vo.Notice;


@WebServlet("/admin/notice/update")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeUpdateServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1. no값 받아올거니 no값 정수형으로 받기
    	int no = Integer.parseInt(request.getParameter("no"));
    	// 2. 게시글에 대한 정보를 가져와서 보여줘야 하니 board객체 가져오기
    	Notice notice=null;
    	
    	// 3. board에 서비스객체의 findBoardByNO메소드 실행시켜 결과값 받기
    	// BoardService의 경우 서블릿마다 동일한 객체니 호출될때만 만들어서 메소드 실행하고 끝나면 소멸되도록 하는게 좀 더 좋음
    	notice = new NoticeService().findNoticeByNo(no);
    
    	// post에서 <br>로 변경했던 것을 다시 개행, 엔터로 변경하기
    	String content=notice.getContent();
    	content=content.replace("<br>","\r\n");
    	notice.setContent(content);
    
    	
    	// 4. jsp에 데이터를 넘겨준다. 그리고 포워딩 시킨다. 
    	request.setAttribute("notice", notice);
    	request.getRequestDispatcher("/views/board/notice_ReUpdate.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// AdminFilter로 관리자 아니면 접근 불가
		int result=0;
    	Notice notice=null;
    	
    	// 내용의 경우 엔터, 개행은 <br>로 대체하는 코드
    	String content=request.getParameter("content");
    	content=content.replace("\r\n","<br>");

    	notice=new Notice();
    	
    	// 사용자가 보낸 정보를 통해 borad객체 생성
    	// no값만 받아서 기존값 받아오고 3개 title, writer, content만 바꿔도 되지만.. 여기선 이렇게!
    	notice.setNo(Integer.parseInt(request.getParameter("no")));
    	notice.setTitle(request.getParameter("title"));
    	notice.setWriterId(request.getParameter("writer"));
    	notice.setContent(content);
    	
    	

    	
    	// 받는 값은 정수값
    	result = new NoticeService().save(notice);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "공지글을 수정하셨습니다.");
    	} else {
    		request.setAttribute("msg", "공지글 수정이 실패하였습니다.");
    	}
    	
    	request.setAttribute("location", "/notice/view?no=" + notice.getNo());
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);  	

	}

}
