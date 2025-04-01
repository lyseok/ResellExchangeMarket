package rem.admin.board.qna.dao;

import org.apache.ibatis.session.SqlSession;

import rem.admin.board.qna.vo.QnaCommentsVO;
import utill.MyBatisUtil;

public class QnaCommentsDaoImpl implements IQnaCommentsDao{
	private static QnaCommentsDaoImpl dao;
	
	// 생성자 막기
	private QnaCommentsDaoImpl() {}
	
	public static QnaCommentsDaoImpl getInstence() {
		if(dao==null) dao = new QnaCommentsDaoImpl();
		return dao;
	}
	
	@Override
	public QnaCommentsVO selectQnaCmt(int qna_no) {
		SqlSession session = null;
		QnaCommentsVO vo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("qnacmt.selectQnaCmt", qna_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return vo;
	}

}
