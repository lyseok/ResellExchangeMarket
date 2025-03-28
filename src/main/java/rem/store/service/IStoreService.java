package rem.store.service;

import java.util.Map;

public interface IStoreService {
	public int getProgSell(int storeId);
	public int getCountAllProducts(int storeId);
	public int getCountSoldoutProducts(int storeId);
	public int updateMypageProfile(Map<String, Object> editedMap);
}
