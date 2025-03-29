package rem.store.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.product.service.IProductService;
import rem.product.service.ProductServiceImpl;
import rem.review.service.IReviewService;
import rem.review.service.ReviewServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;


@WebServlet("/store/tabContent.do")
public class TabContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int storeId = Integer.parseInt((String)request.getParameter("storeId"));
		System.out.println("■■■■■TabContent.servlet ==> storeId : " +storeId);
		
		IReviewService rservice = ReviewServiceImpl.getInstance();
		IProductService pservice = ProductServiceImpl.getInstance();
		
		
		
		
		
		Gson gson = new Gson();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("storeId", storeId);
		
		String json = gson.toJson(map);
		
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		
	}

}
