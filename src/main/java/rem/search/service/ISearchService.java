package rem.search.service;

import java.util.List;


import rem.search.vo.SearchVO;

public interface ISearchService {
	public List<SearchVO> selectSearchProduct(String searchText);
}
