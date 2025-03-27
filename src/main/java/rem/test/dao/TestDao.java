package rem.test.dao;

import org.apache.ibatis.session.SqlSession;

import rem.test.vo.TestVO;
import utill.MyBatisUtil;

public class TestDao {
	public TestVO getTest() {
		SqlSession session = null;
		TestVO vo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("test.getTest");
		} catch (Exception e) {
			e.printStackTrace();		
		} finally {
			if(session != null) session.close();
		}
		
		return vo;
	
	}
	
}
