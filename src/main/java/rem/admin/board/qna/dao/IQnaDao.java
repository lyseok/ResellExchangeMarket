package rem.admin.board.qna.dao;

import java.util.List;
import rem.admin.board.qna.vo.QnaBoardVO;

public interface IQnaDao {
	public List<QnaBoardVO> selectQnaList();
	
	public QnaBoardVO seletQnaView(int qna_no);
}
