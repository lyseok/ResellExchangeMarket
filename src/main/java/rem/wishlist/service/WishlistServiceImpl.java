package rem.wishlist.service;

import java.util.List;

import rem.product.vo.ProductVO;
import rem.wishlist.dao.IWishlistDao;

public class WishlistServiceImpl implements IWishlistService {
	private static IWishlistService instance;
	private IWishlistDao dao;
	
	private WishlistServiceImpl(IWishlistDao dao) {
		this.dao = dao;
	}
	
	public static IWishlistService getInstance(IWishlistDao dao) {
		if(instance == null) instance = new WishlistServiceImpl(dao);
		return instance;
	}
	
	@Override
	public int countWishlist(int mem_no) {
		return dao.countWishlist(mem_no);
	}

	@Override
	public List<ProductVO> getStoreWishList(int storeId) {
		return dao.getStoreWishList(storeId);
	}

}
