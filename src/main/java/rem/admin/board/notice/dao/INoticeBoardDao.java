package rem.admin.board.notice.dao;

import java.util.List;

import rem.admin.board.notice.vo.NoticeBoardVO;

public interface INoticeBoardDao {
	public List<NoticeBoardVO> selectAllNoticeBoard();
	
	public NoticeBoardVO selectNoticeBoard(int no);
	
	public int insertNoticeBoard(NoticeBoardVO vo);
	
	public int updateNoticeBoard(NoticeBoardVO vo);
	
	public int deleteNoticeBoard(int no);
}
