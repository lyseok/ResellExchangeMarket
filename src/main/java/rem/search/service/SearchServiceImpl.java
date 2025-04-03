package rem.search.service;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.admin.board.qna.vo.QnaBoardVO;
import rem.admin.board.qna.vo.QnaSetVO;
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

	@Override
	public List<NoticeBoardVO> searchNoticeBoard(String searchText) {
		return dao.searchNoticeBoard(searchText);
	}

	@Override
	public List<QnaBoardVO> getQnaBoard() {
		return dao.getQnaBoard();
	}

	@Override
	public QnaSetVO getQnaBoard(int qna_no) {
		return dao.getQnaBoard(qna_no);
	}

	@Override
	public List<QnaBoardVO> searchQnaBoard(String searchText) {
		return dao.searchQnaBoard(searchText);
	}

}
