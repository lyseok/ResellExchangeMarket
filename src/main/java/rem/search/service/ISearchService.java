package rem.search.service;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.search.vo.SearchVO;

public interface ISearchService {
	public List<SearchVO> selectSearchProduct(String searchText);
	public List<NoticeBoardVO> searchNoticeBoard(String searchText);
}
