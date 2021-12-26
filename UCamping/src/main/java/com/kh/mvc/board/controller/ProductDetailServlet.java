package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.SaleBoardService;
import com.kh.mvc.board.model.vo.SaleBoard;

@WebServlet("/productDetail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private SaleBoardService service = new SaleBoardService();

    public ProductDetailServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 게시글 조회시 로그인 체크 따로 필요 없게
    	// no값 읽어오기 -> 숫자로
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	System.out.println("No : " + no);
    	
    	SaleBoard saleboard = service.findSaleBoardNo(no);
    	
    	System.out.println("상품게시글 객체 : "+saleboard);
    	
    	request.setAttribute("SaleBoard", saleboard);
    	request.getRequestDispatcher("/views/transaction/productDetail.jsp").forward(request, response);
	}
}
