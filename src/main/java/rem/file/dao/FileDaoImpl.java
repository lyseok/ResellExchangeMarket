package rem.file.dao;

import org.apache.ibatis.session.SqlSession;

import rem.file.vo.ImgFileVO;
import utill.MyBatisUtil;

public class FileDaoImpl implements IFileDao {
	private static FileDaoImpl dao;
	private FileDaoImpl() { }
	public static FileDaoImpl getInstance() {
		if(dao==null) dao = new FileDaoImpl();
		return dao;
	}
	@Override
	public int insertProfileImg(ImgFileVO imgVO) {
		SqlSession session = null;
		int rec = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			rec = session.insert("imgfile.insertProfileImg", imgVO);
			if(rec>0) session.commit();
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return rec;
	}
	@Override
	public ImgFileVO getProfileImg(int mem_no) {
		SqlSession session = null;
		ImgFileVO imgVO = new ImgFileVO();
		try {
			session = MyBatisUtil.getSqlSession();
			imgVO = session.selectOne("imgfile.getProfileImg", mem_no);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return imgVO;
	}
	@Override
	public ImgFileVO getProfileNull() {
		SqlSession session = null;
		ImgFileVO imgVO = new ImgFileVO();
		try {
			session = MyBatisUtil.getSqlSession();
			imgVO = session.selectOne("imgfile.getProfileNull");
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return imgVO;
	}
	@Override
	public int countProfileImg(int mem_no) {
		SqlSession session = null;
		int rec = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			rec = session.selectOne("imgfile.countProfileImg", mem_no);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return rec;
	}
	@Override
	public int deleteProfileImg(int mem_no) {
		SqlSession session = null;
		int rec = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			rec = session.delete("imgfile.deleteProfileImg", mem_no);
			if(rec>0) session.commit();
		}
		catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null) session.close();}
		return rec;
	}
	
}
