package rem.transaction.service;

import java.util.List;
import java.util.Map;

import rem.product.vo.ProductVO;
import rem.review.vo.ReviewVO;
import rem.transaction.vo.ProdTransactionVO;
import rem.transaction.vo.ReviewTransactionVO;
import rem.transaction.vo.ShippingVO;
import rem.transaction.vo.TransactionVO;

public interface ITransactionService {
	
	/**
	 * 상품 리스트 출력
	 * @return
	 */
	public List<ProductVO> getProd(int memberId);
	
	public int insertTransaction(TransactionVO vo);

	public int deleteProd(ProductVO prodVo);
	
	
	public int updateNewing(ProductVO prodVo);
	
	
	
	public List<ProdTransactionVO> getBuyProd(int memberId);
	
	
	public List<ProdTransactionVO> getSellProd(int memberId);
	
	
	public int insertTrackInfo(ShippingVO shipVo);
	
	public ReviewTransactionVO getSellProdReview(int txnNo);
	
	public ShippingVO getTrackInfo(int txnNo);
	
	public int updateConfrimProd(int txnNo);
	
	public int insertReview(ReviewVO reviewVo);
	
}
