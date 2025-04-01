package rem.product.service;


import java.util.List;

import rem.product.dao.IProductDao;
import rem.product.dao.ProductDaoImpl;
import rem.product.vo.CateMainVO;
import rem.product.vo.CateSubVO;

import java.util.List;

import rem.product.dao.IProductDao;
import rem.product.dao.ProductDaoImpl;

import rem.product.vo.ProductVO;

public class ProductServiceImpl implements IProductService {
   private IProductDao dao;
   
   private static ProductServiceImpl service;
   
   private ProductServiceImpl() {
      dao = ProductDaoImpl.getInstance();
   }
   
   public static ProductServiceImpl getInstance() {
      if(service==null) service = new ProductServiceImpl();
      return service;
   }
   
   
   @Override
   public int insertProduct(ProductVO vo) {
      return dao.insertProduct(vo);
   }


   @Override
   public List<CateMainVO> getCateMain() {
      // TODO Auto-generated method stub
      return dao.getCateMain();
   }

   @Override
   public List<CateSubVO> getCateSub(int cate_main_id) {
      // TODO Auto-generated method stub
      return dao.getCateSub(cate_main_id);
   }

@Override
public ProductVO getProductDetail(int prod_no) {
	// TODO Auto-generated method stub
	return dao.getProductDetail(prod_no);
}

@Override
public int getCountAllReview(int mem_no) {
	// TODO Auto-generated method stub
	return dao.getCountAllReview(mem_no);
}

}
