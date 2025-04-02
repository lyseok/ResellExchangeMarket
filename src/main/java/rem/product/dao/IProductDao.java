package rem.product.dao;


import java.util.List;

import rem.product.vo.CateMainVO;
import rem.product.vo.CateNameVO;
import rem.product.vo.CateSubVO;
import rem.product.vo.ProdImgVO;

import java.util.List;

import rem.product.vo.ProductVO;
import rem.product.vo.ViewCountVO;

public interface IProductDao {
   
   public int insertProduct(ProductVO vo);

   
   public List<CateMainVO> getCateMain();
   
   public List<CateSubVO> getCateSub(int cate_main_id);
   
   public ProductVO getProductDetail(int prod_no);
   
   public int getCountAllReview(int mem_no);
   
   public CateNameVO getCateName(int prod_no);
   
   public int updateProductView(int prod_no);
   
   public int insertViewCount(ViewCountVO vo);
   
   public List<ProdImgVO> selectAllMainPageProd();
}