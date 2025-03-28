package rem.admin.board.notice.service;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;

public interface INoticeBoardService {
	public List<NoticeBoardVO> selectAllNoticeBoard();

	public NoticeBoardVO selectNoticeBoard(int no);
	
	public int insertNoticeBoard(NoticeBoardVO vo);
	
	public int updateNoticeBoard(NoticeBoardVO vo);
	
	public int deleteNoticeBoard(int no);
}
