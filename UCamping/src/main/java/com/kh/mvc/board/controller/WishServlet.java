package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.SaleBoardService;


@WebServlet("/saleboard/wish")
public class WishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private SaleBoardService service = new SaleBoardService();
	
    public WishServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    			int result = 0;
    	    	int no = Integer.parseInt(request.getParameter("no"));
    	    	
    	    	System.out.println("No : " + no);
    	    	
    	    	result = service.wish(no);
    	    	
    	    	if(result > 0) {
    				request.setAttribute("msg", "관심상품 등록 성공");
    				request.setAttribute("location", "/saleboard/salelist");
    	    	} 
    	    	
    	    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		}

}
