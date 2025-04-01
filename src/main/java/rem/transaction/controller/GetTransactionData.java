package rem.transaction.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.login.vo.MemberVO;
import rem.product.vo.ProductVO;
import rem.transaction.service.ITransactionService;
import rem.transaction.service.TransactionServiceImpl;
import rem.transaction.vo.ProdTransactionVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;


@WebServlet("/getTransactionData.do")
public class GetTransactionData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		  // category 값이 null이거나 비어있는 경우 처리
        if (category == null) {
           System.out.println("값이 비었");
        }

		
		
		MemberVO loginInfo = (MemberVO) request.getSession().getAttribute("loginInfo");
	    if (loginInfo == null) {
	        response.sendRedirect("/loginPage.jsp");
	        return;
	    }
	   
	    int memberNo = loginInfo.getMem_no(); 
		
	    System.out.println("memberNo:  " + memberNo);
	    ITransactionService service = TransactionServiceImpl.getInstance();
	    List<ProductVO> prodList = null;
	    List<ProdTransactionVO> prodTransList = null;
	    Gson gson = new Gson();
	    String result = null;
	    
	
	    if (category.equals("상품관리")) {
			prodList = service.getProd(memberNo);
			 System.out.println("Product List: " + prodList);
			 result = gson.toJson(prodList); 
			 
		}
	    else if (category.equals("구매관리")) {
	    	prodTransList = service.getBuyProd(memberNo);
			 System.out.println("Product List: " + prodTransList);
			 result = gson.toJson(prodTransList); 
		}
	    else if (category.equals("판매관리")) {
	    	prodTransList = service.getSellProd(memberNo);
			 System.out.println("Product List: " + prodTransList);
			 result = gson.toJson(prodTransList); 
	    }
	    
	    
	    System.out.println("result: " + result);
	   
	    
	   
	    
	    response.setContentType("application/json;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.print(result); 
	    out.flush();
			  
	
		
	    
	    
	    
	    
	    
	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
