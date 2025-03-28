package rem.admin.chat.message.service;

import java.util.List;

import rem.chat.vo.MessageVO;

public interface IMessageService {
	public List<MessageVO> selectMessageList();

	public List<MessageVO> searchMessageNo(int No);
	
	public List<MessageVO> searchMessageCont(String Cont);
}
