package rem.admin.board.notice.service;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;

public interface INoticeBoardService {
	public List<NoticeBoardVO> selectAllNoticeBoard();
}
