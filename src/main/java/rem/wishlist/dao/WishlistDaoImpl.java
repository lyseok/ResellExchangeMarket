package rem.wishlist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.wishlist.vo.WishlistVO;
import utill.MyBatisUtil;

public class WishlistDaoImpl implements IWishlistDao {
	private static IWishlistDao instance;
	
	private WishlistDaoImpl() {}
	
	public static IWishlistDao getInstance() {
		if(instance == null) instance = new WishlistDaoImpl();
		return instance;
	}
	@Override
	public int countWishlist(int mem_no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("wishlist.countWishlist",mem_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public List<WishlistVO> getStoreReviewList(int storeId) {
		SqlSession session = null;
		List<WishlistVO> list = new ArrayList<>();
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("store.getStoreReviewList", storeId);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return list;
	}

}
