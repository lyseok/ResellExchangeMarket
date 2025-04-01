package rem.login.service;

import java.util.Map;

import rem.login.vo.MemberVO;

public interface IMemberService {
	public MemberVO login(Map<String, String> map);
	public int idCheck(String email);
	public int insertMember(MemberVO vo);
	public int pwCheck(Map<String, String> map);
}
