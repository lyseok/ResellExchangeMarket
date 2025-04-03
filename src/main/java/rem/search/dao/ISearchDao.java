package rem.search.dao;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.admin.board.qna.vo.QnaBoardVO;
import rem.admin.board.qna.vo.QnaSetVO;
import rem.search.vo.SearchVO;

public interface ISearchDao {
	public List<SearchVO> selectSearchProduct(String searchText);
	public List<NoticeBoardVO> searchNoticeBoard(String searchText);
	public List<QnaBoardVO> getQnaBoard();
	public QnaSetVO getQnaBoard(int qna_no);
	public List<QnaBoardVO> searchQnaBoard(String searchText);
}
