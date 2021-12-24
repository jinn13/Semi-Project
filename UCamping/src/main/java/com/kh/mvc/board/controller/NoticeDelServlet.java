package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.NoticeService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/admin/notice/delete")
public class NoticeDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();
	
    public NoticeDelServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 아니면 접근 못함, 주소로도 들어오지 못하게 AdminFilter로 막아두었음. 
    	int result=0;


    	int no= Integer.parseInt(request.getParameter("no"));
    	System.out.println("NO : "+no);
    	
    	result=service.delete(no);
    	// System.out.println("어디까지 가나 확인중..result? : "+result);
    	// 0보다 크면 삭제성공
		if(result>0) {
    		request.setAttribute("msg", "공지글을 삭제하셨습니다.");
    		request.setAttribute("location", "/notice");
    		// request.setAttribute("script", "alert();");
		}else {
			// 0과 같거나 작으면 삭제 실패
    		request.setAttribute("msg", "공지글이 삭제되지 않았습니다.");
    		request.setAttribute("location", "/notice");
    	
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}
}
