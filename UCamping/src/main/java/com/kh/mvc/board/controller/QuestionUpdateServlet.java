package com.kh.mvc.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.QuestionService;
import com.kh.mvc.board.model.vo.QuestionBoard;
import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/question/update")
public class QuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private QuestionService service=new QuestionService();
       

    public QuestionUpdateServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		QuestionBoard board=null;
    	// 로그인체크
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
        	String loginId=loginMember.getId();
        	
        	QuestionBoard board1=service.findQBoardByNo(no);
        	String isYou=board1.getWriterId();
        	
        	// 3. 로그인한 유저의 id와 작성자 id를 비교해서 true면 수정화면을 띄워준다.
    		if(loginId.equals(isYou)) {
    	    	// 3. board에 서비스객체의 findBoardByNO메소드 실행시켜 결과값 받기
    	    	board = new QuestionService().findQBoardByNo(no);
    	    	
    	    	// post에서 <br>로 변경했던 것을 다시 개행, 엔터로 변경하기
    	    	String content=board.getOtoContent();
    	    	content=content.replace("<br>","\r\n");
    	    	board.setOtoContent(content);
    	    	
    	    	// 4. jsp에 데이터를 넘겨준다. 그리고 포워딩 시킨다. 
    	    	request.setAttribute("board", board);
    	    	request.getRequestDispatcher("/views/board/questionReUpdate.jsp").forward(request, response);
    		}else if(!loginId.equals(isYou)){
    			// 해당 게시글 작성자가 아닌경우 다시 리스트로 보낸다. 
        		request.setAttribute("msg", "본인이 작성한 글만 수정 가능합니다.");
        		request.setAttribute("location", "/question");
        		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		}
    		
    	}else {
    		request.setAttribute("msg", "접근에 실패하셨습니다.");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   	
    	int result=0;
    	QuestionBoard board=null;
    	// 새로 서버에 업로드될 파일 이름들
    	String originalFileName = null;
    	String renamedFileName = null;
    	String path = getServletContext().getRealPath("/resources/upload/otoboard");
    	int maxSize = 10485760;	
    	String encoding="UTF-8";
    
    	// 매개값으로 리퀘스트객체, 저장될 위치, 최대사이즈, 인코딩방식, 리네임정책..
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	board=new QuestionBoard();
    	
    	
    	// 내용의 경우 엔터, 개행은 <br>로 대체하는 코드
    	String content=mr.getParameter("content");
    	content=content.replace("\r\n","<br>");
    	
    	// 사용자가 보낸 정보를 통해 borad객체 생성
    	// no값만 받아서 기존값 받아오고 3개 title, writer, content만 바꿔도 되지만.. 여기선 이렇게!
    	board.setOtoNo(Integer.parseInt(mr.getParameter("no")));
    	board.setOtoTitle(mr.getParameter("title"));
    	board.setWriterId(mr.getParameter("writer"));
    	board.setOtoContent(content);
    	// 기존파일의 이름(hidden으로 숨겨둔거)
    	board.setOtoFilename(mr.getParameter("originalFileName"));
    	board.setRenamedFileName(mr.getParameter("renamedFileName"));
    	
    	// 사용자가 보내준 변경할 파일명
    	originalFileName = mr.getOriginalFileName("upfile");
    	renamedFileName = mr.getFilesystemName("upfile");
    	
    	// 만약 사용자가 새로운 파일을 업로드했다면? 새로운 파일 업로드(아니면 위의 원래값 그대로!)
    	if(originalFileName != null && !originalFileName.equals("")) {
//    		String deleteFilePath=path+"/"+board.getRenamedFileName();
    		File file=new File(path+"/"+board.getRenamedFileName());
    		
    		if(file.exists()) {
    			file.delete();
    		}
    		board.setOtoFilename(originalFileName);
        	board.setRenamedFileName(renamedFileName);
    	} 
    	
    	// 받는 값은 정수값
    	result = new QuestionService().save(board);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 수정 실패");
    	}
    	
    	request.setAttribute("location", "/question/view?no=" + board.getOtoNo());
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);  

	}

}
