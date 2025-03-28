package rem.admin.board.notice.service;

import java.util.List;

import rem.admin.board.notice.dao.INoticeBoardDao;
import rem.admin.board.notice.vo.NoticeBoardVO;

public class NoticeBoardServiceImpl implements INoticeBoardService {
	private static INoticeBoardService instance;
	private INoticeBoardDao dao;
	
	private NoticeBoardServiceImpl(INoticeBoardDao dao) {
		this.dao = dao;
	}
	
	public static INoticeBoardService getInstance(INoticeBoardDao dao) {
		if(instance == null) instance = new NoticeBoardServiceImpl(dao);
		return instance;
	}
	@Override
	public List<NoticeBoardVO> selectAllNoticeBoard() {
		return dao.selectAllNoticeBoard();
	}

}
