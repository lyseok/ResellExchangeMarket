package rem.admin.board.qna.dao;

import rem.admin.board.qna.vo.QnaCommentsVO;

public interface IQnaCommentsDao {
	public QnaCommentsVO selectQnaCmt(int qna_no);
}
