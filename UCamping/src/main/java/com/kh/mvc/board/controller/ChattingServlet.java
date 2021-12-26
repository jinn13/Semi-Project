package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/chatting")
public class ChattingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service=new MemberService();

    public ChattingServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
		
		if(loginMember != null) {
			request.getRequestDispatcher("/views/member/chatting.jsp").forward(request, response);
			
			
		} else {
			request.setAttribute("msg", "로그인 후 접근가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
	}

}
