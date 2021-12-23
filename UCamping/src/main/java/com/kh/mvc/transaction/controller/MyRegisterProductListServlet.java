package com.kh.mvc.transaction.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/myregister")
public class MyRegisterProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyRegisterProductListServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/transaction/myRegisterProductList.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 필요없으면 지우기
		doGet(request, response);
	}

}
