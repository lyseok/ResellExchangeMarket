package rem.transaction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;

import rem.product.vo.ProductVO;
import rem.review.vo.ReviewVO;
import rem.transaction.vo.ProdTransactionVO;
import rem.transaction.vo.ReviewTransactionVO;
import rem.transaction.vo.ShippingVO;
import rem.transaction.vo.TransactionVO;
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


	@Override
	public int updateNewing(ProductVO prodVo) {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.update("trans.updateNewing", prodVo);
			
			
			if (count > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		return count;
	}
	
	
	
	@Override
	public List<ProdTransactionVO> getBuyProd(int memberId) {
		SqlSession session = null;
		List<ProdTransactionVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("trans.getBuyProd", memberId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}


	@Override
	public List<ProdTransactionVO> getSellProd(int memberId) {
		SqlSession session = null;
		List<ProdTransactionVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("trans.getSellProd", memberId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}


	@Override
	public int insertTrackInfo(ShippingVO shipVo) {
		SqlSession session = null;
		int count = 0;
		
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.insert("trans.insertTrackInfo", shipVo);
			if(count > 0 ) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		
		return count;
	}


	@Override
	public ReviewTransactionVO getSellProdReview(int txnNo) {
		SqlSession session = null;
		ReviewTransactionVO rvo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			rvo = session.selectOne("trans.getSellProdReview", txnNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		return rvo;
	}


	@Override
	public ShippingVO getTrackInfo(int txnNo) {
		SqlSession session = null;
		ShippingVO svo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			svo = session.selectOne("trans.getTrackInfo", txnNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		return svo;
	}


	@Override
	public int updateConfrimProd(int txnNo) {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.update("trans.updateConfrimProd", txnNo);
			
			
			if (count > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		return count;
	}


	@Override
	public int insertReview(ReviewVO reviewVo) {
		SqlSession session = null;
		int count = 0;
		
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.insert("trans.insertReview", reviewVo);
			if(count > 0 ) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
		
		return count;
	}


	@Override
	public int insertTransaction(TransactionVO vo) {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.insert("trans.insertTransaction", vo);
			if(count >0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	

	

}


