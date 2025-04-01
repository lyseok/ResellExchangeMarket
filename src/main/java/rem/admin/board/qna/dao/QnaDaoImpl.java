package rem.admin.board.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.admin.board.qna.vo.QnaBoardVO;
import utill.MyBatisUtil;

public class QnaDaoImpl implements IQnaDao {
	
	private static QnaDaoImpl dao = null;
	
	// 생성자 막기
	private QnaDaoImpl() {}
	
	public static QnaDaoImpl getinstance() {
		if(dao == null) dao = new QnaDaoImpl();
		return dao;
	}

	@Override
	public List<QnaBoardVO> selectQnaList() {
		SqlSession session = null;
		List<QnaBoardVO> qnaList = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			qnaList = session.selectList("qna.selectQnaList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return qnaList;
	}

	
	@Override
	public QnaBoardVO seletQnaView(int qna_no) {
		SqlSession session = null;
		QnaBoardVO vo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("qna.seletQnaView", qna_no);
			System.out.println(vo.getMem_no());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}

	
	
	@Override
	public int deleteQna(int qna_no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("qna.deleteQna", qna_no);
			if(cnt > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

}
