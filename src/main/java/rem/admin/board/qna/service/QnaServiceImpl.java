package rem.admin.board.qna.service;

import java.util.List;

import rem.admin.board.qna.dao.IQnaDao;
import rem.admin.board.qna.dao.QnaDaoImpl;
import rem.admin.board.qna.vo.QnaBoardVO;

public class QnaServiceImpl implements IQnaService {
	// dao 가져오기
	private IQnaDao dao;
	
	// 서비스
	private static QnaServiceImpl service;
	
	// 생성자 막기
	private QnaServiceImpl() {
		dao = QnaDaoImpl.getinstance();
	}
	
	// 최초 한번 생성자에서 서비스 생성하기 
	public static QnaServiceImpl getInstance() {
		if(service == null) service = new QnaServiceImpl();
		return service;
	}

	/**
	 *	게시글 목록(리스트) 
	 *	return: List<QnaVO> 
	 */
	@Override
	public List<QnaBoardVO> selectQnaList() {
		return dao.selectQnaList();
	}
	
	/**
	 *	게시글 보기 
	 *	parameter: 게시글 번호
	 *	return: QnaVO 
	 */
	@Override
	public QnaBoardVO seletQnaView(int qna_no) {
		// TODO Auto-generated method stub
		return dao.seletQnaView(qna_no);
	}

}
