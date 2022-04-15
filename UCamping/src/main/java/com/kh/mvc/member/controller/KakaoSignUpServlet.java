package com.kh.mvc.member.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


@WebServlet("/kakaosignup")
public class KakaoSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService(); 

    public KakaoSignUpServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/join.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=utf-8");
    	HttpSession session;
	    
	    Enumeration params = request.getParameterNames();
	    while(params.hasMoreElements()) {
	      String name = (String) params.nextElement();
	      System.out.print(" ▶ "+name + " : " + request.getParameter(name)); 
	    }
	    System.out.println();

		String id = request.getParameter("id");
		System.out.println("아이디 : "+id);
		String email = request.getParameter("kakao_account[email]");
		System.out.println("이메일 : "+email);
		String nickName = request.getParameter("properties[nickname]");
		System.out.println("닉네임 : "+nickName);
		String image = request.getParameter("properties[profile_image]");
		System.out.println("이미지 : "+image);
		
		
		Member member = new Member();
		
		member.setId(id);
		member.setNickname(nickName);
		member.setEmail(email);
		member.setProfileImg(image);
		
    	System.out.println(member);
    	
    	
    	Member resultM = service.findMemberById(id);
    	System.out.println("DB에서 조회한 회원값 : "+resultM);
    	
    	if(resultM == null) {
    		// 회원정보가 없다면 SNS회원가입을 시킨다.
    		service.save(member);
    	} 
    	
		// 회원정보가 있다면 SNS로그인을 시킨다.
    	Member loginMember = service.sns_login(id, email);	
       	System.out.println(loginMember);
       	
    	if(loginMember!=null) {
    		session = request.getSession();
    		session.setAttribute("loginMember", loginMember);
    		System.out.println("로그인 성공");        		
    	} else {
    		System.out.println("로그인 실패");        		
    	}
    	
    	
//     [현재 문제점]
//     1. sns로그인을 하면 회원정보 수정 시, 비밀번호 변경 못하게 해야함. 
//     2. 회원탈퇴 후 다시 로그인 시도하면 에러발생. 상태값이 n이다보니 회원가입으로 들어가는데..그때 no이 유니크 제약조건에 걸려서.  
//     3. 로그인 플랫폼 설정해야함. 
	}

}
