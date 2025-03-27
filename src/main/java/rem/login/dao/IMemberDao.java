package rem.login.dao;

import java.util.Map;

import rem.login.vo.MemberVO;

public interface IMemberDao {
	public MemberVO login(Map<String, String> map);
}
