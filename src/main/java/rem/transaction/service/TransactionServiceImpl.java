package rem.transaction.service;

import java.util.List;
import java.util.Map;

import rem.product.vo.ProductVO;
import rem.transaction.dao.ITransactionDao;
import rem.transaction.dao.TransactionDaoImpl;
import rem.transaction.vo.ProdTransactionVO;

public class TransactionServiceImpl implements ITransactionService{
	
	private static TransactionServiceImpl service;
	
	private ITransactionDao dao;
	

	private TransactionServiceImpl() {
		dao = TransactionDaoImpl.getInstance();
	}
	
	public static TransactionServiceImpl getInstance(){
		if (service == null) {
			service = new TransactionServiceImpl();
		}
		return service;
	}

	@Override
	public List<ProductVO> getProd(int memberId) {
		return dao.getProd(memberId);
	}

	@Override
	public int deleteProd(ProductVO prodVo) {
		
		return dao.deleteProd(prodVo);
	}

	@Override
	public int updateNewing(ProductVO prodVo) {
		return dao.updateNewing(prodVo); 
	}

	@Override
	public List<ProdTransactionVO> getBuyProd(int memberId) {
		return dao.getBuyProd(memberId);
	}

	@Override
	public List<ProdTransactionVO> getSellProd(int memberId) {
		return dao.getSellProd(memberId);
	}
	
	
	
	
	
}
