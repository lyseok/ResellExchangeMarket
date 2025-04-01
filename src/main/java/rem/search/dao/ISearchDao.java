package rem.search.dao;

import java.util.List;

import rem.search.vo.SearchVO;

public interface ISearchDao {
	public List<SearchVO> selectSearchProduct(String searchText);
}
