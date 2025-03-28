package rem.file.dao;

import rem.file.vo.ImgFileVO;

public interface IFileDao {
	public int insertProfileImg(ImgFileVO imgVO);
	public ImgFileVO getProfileImg(int mem_no);
}
