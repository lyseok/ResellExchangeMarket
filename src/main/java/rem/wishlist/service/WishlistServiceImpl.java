package rem.wishlist.service;

import java.util.List;

import rem.wishlist.dao.IWishlistDao;
import rem.wishlist.vo.WishlistVO;

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
	public List<WishlistVO> getStoreReviewList(int storeId) {
		return dao.getStoreReviewList(storeId);
	}

}
