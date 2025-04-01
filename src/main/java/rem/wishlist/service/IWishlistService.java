package rem.wishlist.service;

import java.util.List;

import rem.product.vo.ProductVO;

public interface IWishlistService {
	public int countWishlist(int mem_no);
	public List<ProductVO> getStoreWishList(int storeId);
}
