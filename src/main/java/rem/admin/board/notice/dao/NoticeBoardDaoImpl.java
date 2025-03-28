package rem.admin.board.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.admin.board.notice.vo.NoticeBoardVO;
import utill.MyBatisUtil;

public class NoticeBoardDaoImpl implements INoticeBoardDao {
	private static INoticeBoardDao instance;
	
	private NoticeBoardDaoImpl() {}
	
	public static INoticeBoardDao getInstance() {
		if(instance == null) instance = new NoticeBoardDaoImpl();
		return instance;
	}
	@Override
	public List<NoticeBoardVO> selectAllNoticeBoard() {
		SqlSession session = null;
		List<NoticeBoardVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("noticeBoard.selectAllNoticeBoard");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

}
