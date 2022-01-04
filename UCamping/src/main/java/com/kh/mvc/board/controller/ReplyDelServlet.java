package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.mvc.board.model.service.SaleBoardService;
import com.kh.mvc.board.model.vo.Reply;
import com.kh.mvc.board.model.vo.SaleBoard;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/productDetail/delete")
public class ReplyDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SaleBoardService service = new SaleBoardService();

	public ReplyDelServlet() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		int no = Integer.parseInt(request.getParameter("no"));
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		// System.out.println("★replyNo★ : " + replyNo);

		// 로그인체크
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;

		// 로그인을 했다면 본인 게시글인지 확인
		if (loginMember != null) {
			// 1. 로그인 한 유저의 id를 가져온다.
			String loginId = loginMember.getId();
			// 2. 해당 덧글을 작성한 유저의 id를 가져온다.
			SaleBoard board = service.findSaleBoardNo(no);

			List<Reply> rp = board.getReplies();

			List<Reply> rp2 = rp.stream().filter(rp3 -> rp3.getNo() == replyNo).collect(Collectors.toList());

			Reply rp3 = rp2.get(0);

			String isYou = rp3.getWriterId();

			// 3. 로그인한 유저의 id와 작성자 id를 비교해서 true면 삭제한다.
			if (loginId.equals(isYou)) {
				result = service.deleteReply(replyNo);
			}

			if (result > 0) {
				request.setAttribute("msg", "댓글을 삭제하셨습니다.");
				request.setAttribute("location", "/productDetail?no=" + no);
			} else {
				// 해당 게시글 작성자가 아닌경우 다시 리스트로 보낸다.
				request.setAttribute("msg", "본인이 작성한 댓글만 삭제 가능합니다.");
				request.setAttribute("location", "/productDetail?no=" + no);
			}

			// 로그인한 유저가 아니면 접근 불가능함
		} else {
			request.setAttribute("msg", "접근에 실패하셨습니다.");
			request.setAttribute("location", "/productDetail?no=" + no);

		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}
}
