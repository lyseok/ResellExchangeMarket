package rem.wishlist.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rem.login.vo.MemberVO;
import rem.wishlist.dao.WishlistDaoImpl;
import rem.wishlist.service.IWishlistService;
import rem.wishlist.service.WishlistServiceImpl;
import rem.wishlist.vo.WishlistVO;

import java.io.IOException;


@WebServlet("/wishlist/deleteWish.do")
public class DeleteWish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		int memId = loginInfo.getMem_no();
		int prod_no = Integer.parseInt(request.getParameter("prod_no"));
		
		WishlistVO wvo = new WishlistVO();
		
		wvo.setMem_no(memId);
		wvo.setProd_no(prod_no);
		
		IWishlistService service = WishlistServiceImpl.getInstance(WishlistDaoImpl.getInstance());
		
		service.deleteWish(wvo);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
