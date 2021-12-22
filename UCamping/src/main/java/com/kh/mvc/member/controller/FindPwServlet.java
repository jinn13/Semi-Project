package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet(name="find-pw", urlPatterns="/find-pw")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service=new MemberService();   

    public FindPwServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/find-pw.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이름과 전화번호로 DB에 있는 값인지 확인하고 결과를 전달하는 기능

		Member ismember=new Member();
    	HttpSession session=null;
    	
    	// Id, 이름, 전화번호를 변수에 저장
    	String userId = request.getParameter("userId");
    	String userName = request.getParameter("userName");
    	String userPhone = request.getParameter("userPhone");
    	
    	// 잘 가져오나 확인
    	System.out.println("UserId : " +userId);
    	System.out.println("UserName : " +userName);
    	System.out.println("UserPhone : " +userPhone);
    	
    	// ismember변수에 서비스의 isDubplicete 메소드에 매개값을 전달하고 처리된 결과 저장하기 
    	ismember=service.isMember(userId, userName, userPhone);

    	// session에 저장중
    	session=request.getSession();
    	session.setAttribute("ismember", ismember);
    	System.out.println("값 확인 중 : "+ismember);
    	
    	// json형태, utf-8 설정
    	response.setContentType("application/json; charset=UTF-8");
    	
    	// 객체를 클라이언트에 json형태로 내려주었음. 
    	new Gson().toJson(ismember, response.getWriter());
	}

}
