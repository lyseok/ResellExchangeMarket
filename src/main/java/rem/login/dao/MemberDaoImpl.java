package rem.login.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import rem.login.vo.MemberVO;
import utill.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao {
	private static IMemberDao instance = null;
	
	private MemberDaoImpl() {}
	
	public static IMemberDao getInstance() {
		if(instance == null) instance = new MemberDaoImpl();
		return instance;
	}
	
	@Override
	public MemberVO login(Map<String, String> map) {
		SqlSession session = null;
		MemberVO vo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("member.login", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return vo;
	}

}
