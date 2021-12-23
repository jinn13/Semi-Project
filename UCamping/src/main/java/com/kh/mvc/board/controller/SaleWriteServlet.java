package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kh.mvc.board.model.service.SaleBoardService;
import com.kh.mvc.board.model.vo.SaleBoard;
import com.kh.mvc.common.util.FileRename;
//import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/board/salewrite")								
public class SaleWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
									
	private SaleBoardService service = new SaleBoardService();
	
    public SaleWriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	String viewName = "/views/transaction/sellgoods.jsp";
    	
    	if(loginMember == null) {    
    		viewName = "/views/common/msg.jsp";
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher(viewName).forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/saleboard");
    	 
    	// 파일의 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 문자에 대한 인코딩 설정
    	String encoding = "UTF-8";
    	
    	/*
    	 * DefaultFileRenamePolicy
    	 *   - 업로드되는 파일에 대한 rename 처리에 사용된다.
    	 *   - 중복되는 이름 뒤에 0 ~ 9999 붙인다.
    	 */
    	
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 폼 파라미터로 넘어온 값들(파일에 대한 정보 X)
//    	String writerNo = Integemr.getParameter("writerNo");
    	String title = mr.getParameter("title");
    	String content = mr.getParameter("content");
    	String price = mr.getParameter("price");
    	String category = mr.getParameter("category");
    	String goodsstatus = mr.getParameter("goodsStatus");
    	String dealStatus = mr.getParameter("dealStatus");
    	
    	// 파일에 대한 정보를 가져올 때
    	String filesystemName = mr.getFilesystemName("upfile");
    	String FileName = mr.getOriginalFileName("upfile");
    	
    	// 로그인 안된 사용자가 게시글 작성이 불가능하도록 체크하는 로직
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {    
    		SaleBoard saleboard = new SaleBoard();
    		
//    		saleboard.setWriterNo(writerNo);
    		saleboard.setTitle(title);
    		saleboard.setPrice(price);
    		saleboard.setCategory(category);
    		saleboard.setFileName(FileName);
    		saleboard.setGoodsStatus(goodsstatus);
    		saleboard.setDealStatus(dealStatus);
    		saleboard.setContent(content);
    		saleboard.setRenamedFileName(filesystemName);
    		
    		result = service.save(saleboard);
    		
    		if(result > 0) {
    			request.setAttribute("msg", "게시글 등록 성공");
    			request.setAttribute("location", "/saleboard/salelist");
        	} else {
    			request.setAttribute("msg", "게시글 등록 실패");
    			request.setAttribute("location", "/saleboard/salelist");
        	}
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");			
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}