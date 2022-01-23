package com.kh.mvc.member.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.vo.Member;


@WebServlet("/kakaosignup")
public class KakaoSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public KakaoSignUpServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/join.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=utf-8");
	    
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
		member.setName(nickName);
		member.setEmail(email);
		member.setProfileImg(image);
		
    	System.out.println(member);
	}

}
