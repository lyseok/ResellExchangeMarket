package rem.test.service;

import rem.test.dao.TestDao;
import rem.test.vo.TestVO;

public class TestService {
	TestDao dao = new TestDao();
	
	public TestVO getTest() {
		return dao.getTest(); 
	}
}
