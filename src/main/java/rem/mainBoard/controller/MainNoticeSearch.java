package rem.mainBoard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.search.dao.SearchDaoImpl;
import rem.search.service.ISearchService;
import rem.search.service.SearchServiceImpl;

import java.io.IOException;
import java.util.List;



@WebServlet("/main/notice/search.do")
public class MainNoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchText = request.getParameter("sch");
		
		ISearchService service = SearchServiceImpl.getInstance(SearchDaoImpl.getInstance());
		List<NoticeBoardVO> list = service.searchNoticeBoard(searchText);
		for(NoticeBoardVO vo : list) {
			String noticeTitle = vo.getNotice_title();
			System.out.println(noticeTitle+"■■■■");
		}
		
		
		request.setAttribute("searchedList", list);
		System.out.println(list);
		request.setAttribute("searchText", searchText);
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■   "+ searchText);
		request.getRequestDispatcher("/WEB-INF/mainBoard/mainNoticeSearch.jsp").forward(request, response);
	}



}
