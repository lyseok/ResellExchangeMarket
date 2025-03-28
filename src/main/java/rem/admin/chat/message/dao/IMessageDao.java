package rem.admin.chat.message.dao;

import java.util.List;

import rem.chat.vo.MessageVO;

public interface IMessageDao {
	public List<MessageVO> selectMessageList();
	
	public List<MessageVO> searchMessageNo(int No);
	
	public List<MessageVO> searchMessageCont(String Cont);
}
