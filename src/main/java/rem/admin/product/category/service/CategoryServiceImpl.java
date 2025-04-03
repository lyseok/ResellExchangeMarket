package rem.admin.product.category.service;

import rem.admin.product.category.dao.CategoryDaoImpl;
import rem.admin.product.category.dao.ICategoryDao;

public class CategoryServiceImpl implements ICategoryService{
	private static CategoryServiceImpl service;
	
	private ICategoryDao dao;
	
	// 생성자 막기
	private CategoryServiceImpl() {
		dao = CategoryDaoImpl.getInstence();
	}
	
	public static CategoryServiceImpl getInstence() {
		if(service==null) service = new CategoryServiceImpl();
		return service;
	}
	
	
	
}
