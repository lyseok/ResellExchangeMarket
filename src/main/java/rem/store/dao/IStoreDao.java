package rem.store.dao;

import java.util.Map;

import rem.login.vo.MemberVO;

public interface IStoreDao {
	public int getProgSell(int storeId);
	public int getCountAllProducts(int storeId);
	public int getCountSoldoutProducts(int storeId);
	public int updateMypageProfile(Map<String, Object> editedMap);
	public MemberVO getStoreInfoByProd(int prod_no);
	public MemberVO getStoreInfoByMem(int mem_no);
}
