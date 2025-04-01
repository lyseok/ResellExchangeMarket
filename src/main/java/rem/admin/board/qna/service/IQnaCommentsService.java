package rem.admin.board.qna.service;

import rem.admin.board.qna.vo.QnaCommentsVO;

public interface IQnaCommentsService {
	public QnaCommentsVO selectQnaCmt(int qna_no);
}
