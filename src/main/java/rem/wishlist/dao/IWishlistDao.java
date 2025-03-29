package rem.wishlist.dao;

import java.util.List;

import rem.wishlist.vo.WishlistVO;

public interface IWishlistDao {
	public int countWishlist(int mem_no);
	public List<WishlistVO> getStoreReviewList(int storeId);
}
