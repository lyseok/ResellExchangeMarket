package rem.transaction.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.review.vo.ReviewVO;
import rem.transaction.service.ITransactionService;
import rem.transaction.service.TransactionServiceImpl;
import rem.transaction.vo.ReviewTransactionVO;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;

@WebServlet("/insertReview.do")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int txnNo = Integer.parseInt(request.getParameter("txnNo"));
		String reviewCont = request.getParameter("reviewCont");
		int reviewRating =  Integer.parseInt(request.getParameter("reviewRating"));
		
		ITransactionService service = TransactionServiceImpl.getInstance();
		
		
		ReviewVO rvo = new ReviewVO();
		
		Gson gson = new Gson();
		
		rvo.setReview_cont(reviewCont);
		rvo.setReview_rating(reviewRating);
		rvo.setTxn_no(txnNo);
		System.out.println("reviewVO" + rvo);
		
		int count = 0;
		
		count = service.insertReview(rvo);
		
		String result = gson.toJson(rvo);
		   
		
		PrintWriter out = response.getWriter();

	    if (count > 0) {
	            out.write("{\"status\": \"success\"}");
	    } else {
	            out.write("{\"status\": \"error\", \"message\": \"리뷰 입력 실패\"}");
	     }
	    out.flush();
	}

}
