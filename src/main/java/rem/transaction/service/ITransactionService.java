package rem.transaction.service;

import java.util.List;
import java.util.Map;

import rem.product.vo.ProductVO;
import rem.transaction.vo.ProdTransactionVO;

public interface ITransactionService {
	
	/**
	 * 상품 리스트 출력
	 * @return
	 */
	public List<ProductVO> getProd(int memberId);
	

	public int deleteProd(ProductVO prodVo);
	
	
	public int updateNewing(ProductVO prodVo);
	
	
	
	public List<ProdTransactionVO> getBuyProd(int memberId);
	
	
	public List<ProdTransactionVO> getSellProd(int memberId);
	
}
