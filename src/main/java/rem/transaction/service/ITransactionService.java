package rem.transaction.service;

import java.util.List;
import java.util.Map;

import rem.product.vo.ProductVO;

public interface ITransactionService {
	
	/**
	 * 상품 리스트 출력
	 * @return
	 */
	public List<ProductVO> getProd(int memberId);
	

	public int deleteProd(ProductVO prodVo);
}
