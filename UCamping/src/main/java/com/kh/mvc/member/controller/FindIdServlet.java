package com.kh.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.mvc.member.model.service.MemberService;

@WebServlet("/find-id")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private MemberService service=new MemberService();

    public FindIdServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/find-id.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
		// ID값을 가져와서 DB에 있는 값인지 확인하고 결과를 전달하는 기능
    	Map<String, Boolean> map = new HashMap<>();
    	String userName = request.getParameter("userName");
    	String userPhone = request.getParameter("userPhone");
    	
    	System.out.println("UserName : " +userName);
    	System.out.println("UserPhone : " +userPhone);

    	// 실제 DB에 존재하는지 서비스에게 받아서 true, false로 받고.
    	map.put("duplicate", service.isDuplicate(userName, userPhone)); // 키값은 duplicate, value는 true or false

    	System.out.println(map);
    	response.setContentType("application/json; charset=UTF-8");
    	
    	// 맵 객체를 클라이언트에 json형태로 내려준다..
    	new Gson().toJson(map, response.getWriter());
    	
//    	request.getRequestDispatcher("/views/member/find-id.jsp").forward(request, response);
    	
//		doGet(request, response);
	}

}
