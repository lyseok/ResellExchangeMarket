package rem.admin.product.category.dao;

public class CategoryDaoImpl implements ICategoryDao {
	private static CategoryDaoImpl dao;
	
	// 생성자 막기
	private CategoryDaoImpl (){}
	
	public static CategoryDaoImpl getInstence() {
		if(dao == null) dao = new CategoryDaoImpl();
		return dao;
	}
	

}
