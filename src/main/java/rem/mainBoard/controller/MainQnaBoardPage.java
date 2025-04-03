package rem.mainBoard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.admin.board.qna.vo.QnaBoardVO;
import rem.login.vo.MemberVO;
import rem.search.dao.SearchDaoImpl;
import rem.search.service.ISearchService;
import rem.search.service.SearchServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/main/qna.do")
public class MainQnaBoardPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			request.getRequestDispatcher("/WEB-INF/login/login.jsp").forward(request, response);
			return;
		}
		
		String searchText = request.getParameter("search");
		if(searchText!=null)
			request.setAttribute("searchText", searchText);
		
		ISearchService service = SearchServiceImpl.getInstance(SearchDaoImpl.getInstance());
		List<QnaBoardVO> list = service.searchQnaBoard(searchText);
		for(QnaBoardVO vo : list) {
			String qnaTitle = vo.getQna_title();
			System.out.println(qnaTitle+"■■■■");
		}
		request.setAttribute("board", "qna");
		
		request.setAttribute("searchedList", list);
		System.out.println(list);
		request.setAttribute("searchText", searchText);
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■   "+ searchText);
		
		request.getRequestDispatcher("/WEB-INF/mainBoard/mainQna.jsp").forward(request, response);
	}
}