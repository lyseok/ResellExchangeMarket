package rem.transaction.dao;

import java.util.List;
import java.util.Map;

import rem.product.vo.ProductVO;
import rem.transaction.vo.ProdTransactionVO;

public interface ITransactionDao {
	public List<ProductVO> getProd(int memberId);
	
	
	public int deleteProd(ProductVO prodVo);
	
	
	public int updateNewing(ProductVO prodVo);
	
	
	public List<ProdTransactionVO> getBuyProd(int memberId);
	
	
	public List<ProdTransactionVO> getSellProd(int memberId);
	
}
