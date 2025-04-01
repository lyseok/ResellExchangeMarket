package rem.admin.board.notice.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.admin.board.notice.dao.NoticeBoardDaoImpl;
import rem.admin.board.notice.service.INoticeBoardService;
import rem.admin.board.notice.service.NoticeBoardServiceImpl;
import rem.admin.board.notice.vo.NoticeBoardVO;

import java.io.IOException;

@WebServlet("/admin/insertNotice.do")
public class InsertNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("noticeTitle");
		String content = request.getParameter("noticeContent");
		// String file = request.getParameter("noticeFile");
		
		NoticeBoardVO vo = new NoticeBoardVO();
		
		vo.setNotice_title(title);
		vo.setNotice_cont(content);
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance(NoticeBoardDaoImpl.getInstance());
		int res = service.insertNoticeBoard(vo);
		
		if(res > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/noticePage.do");
		}
	}

}
