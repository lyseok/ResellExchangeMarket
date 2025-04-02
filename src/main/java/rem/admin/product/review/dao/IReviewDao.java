package rem.admin.product.review.dao;

import java.util.List;

import rem.review.vo.ReviewImgVO;

public interface IReviewDao {
	public List<ReviewImgVO> selectReviewList();
}
