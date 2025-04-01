package rem.wishlist.dao;

import java.util.List;

import rem.product.vo.ProductVO;

public interface IWishlistDao {
	public int countWishlist(int mem_no);
	public List<ProductVO> getStoreWishList(int storeId);
}
