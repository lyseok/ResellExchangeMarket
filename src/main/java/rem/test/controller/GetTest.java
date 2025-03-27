package rem.test.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.test.service.TestService;
import rem.test.vo.TestVO;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;


@WebServlet("/getTest.do")
public class GetTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		System.out.println("Test");
		Gson gson = new Gson();
		TestService service = new TestService();
		
		TestVO vo = service.getTest();
		
		String json = gson.toJson(vo.getTest());
		
		PrintWriter out = response.getWriter();
		System.out.println(json);
		
		out.print(json);
		
		response.flushBuffer();
	}

}
