package rem.transaction.dao;

import java.util.List;
import java.util.Map;

import rem.product.vo.ProductVO;

public interface ITransactionDao {
	public List<ProductVO> getProd(int memberId);
	
	
	public int deleteProd(ProductVO prodVo);
}
