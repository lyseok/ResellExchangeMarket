package rem.search.service;

import java.util.List;

import rem.search.dao.ISearchDao;
import rem.search.vo.SearchVO;

public class SearchServiceImpl implements ISearchService {
	private static ISearchService instance;
	private ISearchDao dao;
	
	private SearchServiceImpl(ISearchDao dao) {
		this.dao = dao;
	}
	
	public static ISearchService getInstance(ISearchDao dao) {
		if(instance == null) instance = new SearchServiceImpl(dao);
		return instance;
	}
	
	@Override
	public List<SearchVO> selectSearchProduct(String searchText) {
		return dao.selectSearchProduct(searchText);
	}

}
