package rem.search.dao;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.search.vo.SearchVO;

public interface ISearchDao {
	public List<SearchVO> selectSearchProduct(String searchText);
	public List<NoticeBoardVO> searchNoticeBoard(String searchText);
}
