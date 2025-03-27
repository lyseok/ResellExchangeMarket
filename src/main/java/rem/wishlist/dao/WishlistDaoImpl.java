package rem.wishlist.dao;

import org.apache.ibatis.session.SqlSession;

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

}
