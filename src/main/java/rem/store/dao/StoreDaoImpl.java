package rem.store.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import utill.MyBatisUtil;

public class StoreDaoImpl implements IStoreDao{
	private static StoreDaoImpl dao;
	private StoreDaoImpl() { }
	public static StoreDaoImpl getInstance() {
		if(dao==null) dao = new StoreDaoImpl();
		return dao;
	}
	@Override
	public int getProgSell(int storeId) {
		SqlSession session = null;
		int countProgSell = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			countProgSell = session.selectOne("store.getProgSell", storeId);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return countProgSell;
	}
	@Override
	public int getCountAllProducts(int storeId) {
		SqlSession session = null;
		int countAllProducts = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			countAllProducts = session.selectOne("store.getCountAllProducts", storeId);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return countAllProducts;
	}
	@Override
	public int getCountSoldoutProducts(int storeId) {
		SqlSession session = null;
		int countSoldoutProducts = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			countSoldoutProducts = session.selectOne("store.getCountSoldoutProducts", storeId);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return countSoldoutProducts;
	}
	@Override
	public int updateMypageProfile(Map<String, Object> editedMap) {
		SqlSession session = null;
		int rec = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			rec = session.update("store.updateMypageProfile", editedMap);
			if(rec>0) session.commit();
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return rec;
	}
	
	
	
	
}
