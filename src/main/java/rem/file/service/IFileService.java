package rem.file.service;

import rem.file.vo.ImgFileVO;

public interface IFileService {
	public int insertProfileImg(ImgFileVO imgVO);
	public ImgFileVO getProfileImg(int mem_no);
}
