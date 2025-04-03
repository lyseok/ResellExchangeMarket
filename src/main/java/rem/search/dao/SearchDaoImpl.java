package rem.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.admin.board.notice.vo.NoticeBoardVO;
import rem.admin.board.qna.vo.QnaBoardVO;
import rem.admin.board.qna.vo.QnaSetVO;
import rem.search.vo.SearchVO;
import utill.MyBatisUtil;

public class SearchDaoImpl implements ISearchDao {
	private static ISearchDao instance;
	
	private SearchDaoImpl() {}
	
	public static ISearchDao getInstance() {
		if(instance == null) instance = new SearchDaoImpl();
		return instance;
	}
	
	@Override
	public List<SearchVO> selectSearchProduct(String searchText) {
		SqlSession session = null;
		List<SearchVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("search.selectSearchProduct", searchText);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public List<NoticeBoardVO> searchNoticeBoard(String searchText) {
		SqlSession session = null;
		List<NoticeBoardVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("search.searchNoticeBoard", searchText);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return list;
	}

	@Override
	public List<QnaBoardVO> getQnaBoard() {
		SqlSession session = null;
		List<QnaBoardVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("search.getQnaBoardList");
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return list;
	}

	@Override
	public QnaSetVO getQnaBoard(int qna_no) {
		SqlSession session = null;
		QnaSetVO vo = null;
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("search.getQnaBoardOne", qna_no);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return vo;
	}

	@Override
	public List<QnaBoardVO> searchQnaBoard(String searchText) {
		SqlSession session = null;
		List<QnaBoardVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("search.searchQnaBoard", searchText);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return list;
	}

}
