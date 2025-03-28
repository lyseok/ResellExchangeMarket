package rem.admin.board.qna.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.admin.board.qna.service.IQnaService;
import rem.admin.board.qna.service.QnaServiceImpl;
import rem.admin.board.qna.vo.QnaBoardVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

@WebServlet("/admin/qnaPage.do")
public class QnaPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		request.getRequestDispatcher("/WEB-INF/admin/board/qna/qna.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 		IQnaService service = QnaServiceImpl.getInstance();
		
		List<QnaBoardVO> qnalist = service.selectQnaList();
		// DB를 통해서 전달되어 오는 데이터를 이제 목록 페이지로 전달하려면 전달하기 위한 방법이 필요하겠죠?
		// 이럴때는 데이터를 담을수 있는 공간이 필요한데 그런 공간을 request, session과 같은 scope를 활용할 수 있습니다.
		// 그래서 request라는 scope를 이용해 데이터를 전달합니다.
		// 데이터를 전달하려면 전달하기 위한 key와 value가 필요합니다.
		// 그래서 request에 setAttribute() 메소드를 이용해서 key는 'boardList'를 value는 DB를 통해서 전달받은 게시판 목록 데이터를 설정합니다.
		request.setAttribute("qnalist", qnalist);
		
		Gson gson = new Gson();
		
		String list = gson.toJson(qnalist);
		
		PrintWriter writer = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		writer.print(list);
		writer.flush();
	}
	
	

}
