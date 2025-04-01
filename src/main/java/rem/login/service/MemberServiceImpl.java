package rem.login.service;

import java.util.Map;

import rem.login.dao.IMemberDao;
import rem.login.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private static IMemberService instance;
	private IMemberDao dao;
	
	private MemberServiceImpl(IMemberDao dao) {
		this.dao = dao;
	}
	
	public static IMemberService getInstance(IMemberDao dao) {
		if(instance == null) instance = new MemberServiceImpl(dao);
		return instance;
	}

	@Override
	public MemberVO login(Map<String, String> map) {
		return dao.login(map);
	}

	@Override
	public int idCheck(String email) {
		return dao.idCheck(email);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public int pwCheck(Map<String, String> map) {
		return dao.pwCheck(map);
	}

}
