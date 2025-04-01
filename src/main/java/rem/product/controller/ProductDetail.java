package rem.product.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rem.file.service.FileServiceImpl;
import rem.file.service.IFileService;
import rem.file.vo.ImgFileVO;
import rem.product.service.IProductService;
import rem.product.service.ProductServiceImpl;
import rem.product.vo.ProductVO;
import rem.wishlist.dao.IWishlistDao;
import rem.wishlist.dao.WishlistDaoImpl;
import rem.wishlist.service.IWishlistService;
import rem.wishlist.service.WishlistServiceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/product/productDetail.do")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		IProductService service = ProductServiceImpl.getInstance();
		IWishlistService wservice = WishlistServiceImpl.getInstance(WishlistDaoImpl.getInstance());
		IFileService fservice = FileServiceImpl.getInstance();
		List<ImgFileVO> list = new ArrayList<ImgFileVO>();
		
		int prod_no = Integer.parseInt(request.getParameter("prod_no"));
		
		ProductVO pvo = new ProductVO();
		int countReview = 0;
		int countWish = 0;
		
		pvo = service.getProductDetail(prod_no);
		
		countReview = service.getCountAllReview(pvo.getMem_no());
		
		countWish = wservice.countWishlist(pvo.getMem_no());
		
		request.setAttribute("productDetail", pvo);
		request.setAttribute("countReview", countReview);
		request.setAttribute("countWish", countWish);
		
		list = fservice.getProductfileImg(prod_no);
		
		request.setAttribute("imgfile", list);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
