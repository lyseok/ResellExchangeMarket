package rem.file.service;

import rem.file.dao.FileDaoImpl;
import rem.file.dao.IFileDao;
import rem.file.vo.ImgFileVO;

public class FileServiceImpl implements IFileService {
	private IFileDao dao;
	private static FileServiceImpl service;
	private FileServiceImpl() {
		dao = FileDaoImpl.getInstance();
	}
	public static FileServiceImpl getInstance() {
		if(service==null) service = new FileServiceImpl();
		return service;
	}
	@Override
	public int insertProfileImg(ImgFileVO imgVO) {
		return dao.insertProfileImg(imgVO);
	}
	@Override
	public ImgFileVO getProfileImg(int mem_no) {
		return dao.getProfileImg(mem_no);
	}
	@Override
	public ImgFileVO getProfileNull() {
		return dao.getProfileNull();
	}
	@Override
	public int countProfileImg(int mem_no) {
		return dao.countProfileImg(mem_no);
	}
	@Override
	public int deleteProfileImg(int mem_no) {
		return dao.deleteProfileImg(mem_no);
	}
	
}
