package rem.product.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rem.product.vo.CateMainVO;
import rem.product.vo.CateSubVO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


import rem.product.vo.ProductVO;
import utill.MyBatisUtil;

public class ProductDaoImpl implements IProductDao {
   
   private static ProductDaoImpl dao;
   
   private ProductDaoImpl() {};
   
   public static ProductDaoImpl getInstance() {
      if(dao==null) dao = new ProductDaoImpl();
      return dao;
   }

   
   @Override
   public int insertProduct(ProductVO vo) {
      SqlSession session = null;
      int rec = 0;
      try {
         session = MyBatisUtil.getSqlSession();
         rec = session.insert("product.insertProduct", vo);
         if(rec>0) session.commit();
      }
      catch(Exception e) {e.printStackTrace();}
      finally {if(session!=null) session.close();}
      return rec;
   }

   

   @Override
   public List<CateMainVO> getCateMain() {
      SqlSession session = null;
      List<CateMainVO> list = null;
      
      try {
         session = MyBatisUtil.getSqlSession();
         
         list = session.selectList("product.getCateMain");
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         if(session!=null) session.close();
      }
      return list;
   }

   @Override
   public List<CateSubVO> getCateSub(int cate_main_id) {
      SqlSession session = null;
      List<CateSubVO> list = null;
      
      try {
         session = MyBatisUtil.getSqlSession();
         
         list = session.selectList("product.getCateSub", cate_main_id);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         if(session!=null) session.close();
      }
      return list;
   }

@Override
public ProductVO getProductDetail(int prod_no) {
	SqlSession session = null;
	ProductVO pvo = null;
	
	try {
		session = MyBatisUtil.getSqlSession();
		
		pvo = session.selectOne("product.getProductDetail", prod_no);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) session.close();
	}
	return pvo;
}

@Override
public int getCountAllReview(int mem_no) {
	SqlSession session = null;
	int cnt = 0;
	
	try {
		session = MyBatisUtil.getSqlSession();
		
		cnt = session.selectOne("product.getCountAllReview", mem_no);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) session.close();
	}
	return cnt;
}

}
