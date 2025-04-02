package rem.admin.product.review.service;

import java.util.List;

import rem.admin.product.review.dao.IReviewDao;
import rem.admin.product.review.dao.ReviewDaoImpl;
import rem.review.vo.ReviewImgVO;

public class ReviewServiceImpl implements IReviewService {
	private static ReviewServiceImpl service;
	private static IReviewDao dao;
	
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstence();
	}
	
	public static ReviewServiceImpl getInstence() {
		if(service == null) service = new ReviewServiceImpl();
		return service;
	}

	@Override
	public List<ReviewImgVO> selectReviewList() {
		return dao.selectReviewList();
	}

}
