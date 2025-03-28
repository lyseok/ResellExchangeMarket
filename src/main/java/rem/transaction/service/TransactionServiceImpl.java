package rem.transaction.service;

import java.util.List;

import rem.product.vo.ProductVO;
import rem.transaction.dao.ITransactionDao;
import rem.transaction.dao.TransactionDaoImpl;

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
	public List<ProductVO> getProd() {
		return dao.getProd();
	}
}
