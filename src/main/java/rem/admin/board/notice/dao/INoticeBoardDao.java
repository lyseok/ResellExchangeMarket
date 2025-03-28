package rem.admin.board.notice.dao;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;

public interface INoticeBoardDao {
	public List<NoticeBoardVO> selectAllNoticeBoard();
}
