package rem.wishlist.service;

import java.util.List;

import rem.wishlist.vo.WishlistVO;

public interface IWishlistService {
	public int countWishlist(int mem_no);
	public List<WishlistVO> getStoreReviewList(int storeId);
}
