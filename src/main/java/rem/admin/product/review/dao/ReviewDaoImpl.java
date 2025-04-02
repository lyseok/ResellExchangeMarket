package rem.admin.product.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.review.vo.ReviewImgVO;
import utill.MyBatisUtil;

public class ReviewDaoImpl implements IReviewDao {
	private static ReviewDaoImpl dao;
	
	private ReviewDaoImpl () {}
	
	public static ReviewDaoImpl getInstence(){
		if(dao==null) dao = new ReviewDaoImpl();
		return dao;
	}
	

	@Override
	public List<ReviewImgVO> selectReviewList() {
		SqlSession session = null;
		List<ReviewImgVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("admrv.selectReviewList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}

}
