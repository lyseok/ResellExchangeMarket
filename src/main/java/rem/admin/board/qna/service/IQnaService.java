package rem.admin.board.qna.service;

import java.util.List;

import rem.admin.board.qna.vo.QnaBoardVO;

public interface IQnaService {
	public List<QnaBoardVO> selectQnaList();
	
	public QnaBoardVO seletQnaView(int qna_no);
}
