package rem.transaction.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.product.vo.ProductVO;
import rem.transaction.service.ITransactionService;
import rem.transaction.service.TransactionServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;


@WebServlet("/getTransactionData.do")
public class GetTransactionData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");

	    ITransactionService service = TransactionServiceImpl.getInstance();
	    List<ProductVO> prodList = service.getProd(); 

	    System.out.println("Product List: " + prodList);
	        
	        Gson gson = new Gson();
	        String result = gson.toJson(prodList);  
	        System.out.println("result: " + result);

	       
	        response.setContentType("application/json;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(result); // JSON 데이터 출력
	        out.flush();
	  
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
