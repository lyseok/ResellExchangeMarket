package rem.transaction.dao;

import java.util.List;
import java.util.Map;

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
	public List<ProductVO> getProd(int memberId) {
		SqlSession session = null;
		List<ProductVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("trans.getProd", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}


	@Override
	public int deleteProd(ProductVO prodVo) {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.update("trans.deleteProd", prodVo);
			
		
			if (count > 0) {
				session.commit();
			} else {
				System.out.println("실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.commit();
			}
		}
		
		return count;
		
	}
	
	
	
	

}


