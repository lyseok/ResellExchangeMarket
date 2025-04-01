package rem.product.service;


import java.util.List;

import rem.product.vo.CateMainVO;
import rem.product.vo.CateSubVO;

import java.util.List;

import rem.product.vo.ProductVO;

public interface IProductService {
   
   public int insertProduct(ProductVO vo);

   public List<CateMainVO> getCateMain();
   
   public List<CateSubVO> getCateSub(int cate_main_id);

   public ProductVO getProductDetail(int prod_no);
   
   public int getCountAllReview(int mem_no);
}