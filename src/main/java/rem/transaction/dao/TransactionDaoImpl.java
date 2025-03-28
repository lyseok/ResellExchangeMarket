package rem.transaction.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.product.vo.ProductVO;
import utill.MyBatisUtil;

public class TransactionDaoImpl implements ITransactionDao {
	private static TransactionDaoImpl dao;
	
	private TransactionDaoImpl() {}
	
	
	public static TransactionDaoImpl getInstance() {
		if (dao == null) {
			dao = new TransactionDaoImpl();
		}
		return dao;
	}


	@Override
	public List<ProductVO> getProd() {
		SqlSession session = null;
		List<ProductVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("trans.getProd");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}


}
