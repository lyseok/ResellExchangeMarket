package rem.store.service;

import java.util.Map;

import rem.login.vo.MemberVO;
import rem.store.dao.IStoreDao;
import rem.store.dao.StoreDaoImpl;

public class StoreServiceImpl implements IStoreService {
	private static IStoreDao dao;
	private static StoreServiceImpl service;
	private StoreServiceImpl() {
		dao = StoreDaoImpl.getInstance();
	}
	public static StoreServiceImpl getInstance() {
		if(service==null) service = new StoreServiceImpl();
		return service;
	}
	@Override
	public int getProgSell(int storeId) {
		return dao.getProgSell(storeId);
	}
	@Override
	public int getCountAllProducts(int storeId) {
		return dao.getCountAllProducts(storeId);
	}
	@Override
	public int getCountSoldoutProducts(int storeId) {
		return dao.getCountSoldoutProducts(storeId);
	}
	@Override
	public int updateMypageProfile(Map<String, Object> editedMap) {
		return dao.updateMypageProfile(editedMap);
	}
	@Override
	public MemberVO getStoreInfoByProd(int prod_no) {
		return dao.getStoreInfoByProd(prod_no);
	}
	@Override
	public MemberVO getStoreInfoByMem(int mem_no) {
		return dao.getStoreInfoByMem(mem_no);
	}
	
	
}
