package iuh.edu.serviceImpl;


import java.util.List;

import iuh.edu.dao.CategoryDao;
import iuh.edu.dao.CategoryDaoImpl;
import iuh.edu.entity.Catalog;
import iuh.edu.service.CategoryService;



public class CategoryServicesImpl implements CategoryService {
	CategoryDao categoryDao = new CategoryDaoImpl();

	@Override
	public void insert(Catalog category) {
		categoryDao.insert(category);
	}

	@Override
	public void edit(Catalog newCategory) {
		Catalog oldCate = categoryDao.get(Integer.parseInt(newCategory.getId()));
		oldCate.setName(newCategory.getName());
		oldCate.setParent_id(newCategory.getParent_id());
		categoryDao.edit(oldCate);

	}

	@Override
	public void delete(String id) {
		categoryDao.delete(id);

	}

	@Override
	public Catalog get(int id) {
		return categoryDao.get(id);
	}

	@Override
	public Catalog get(String name) {
		return categoryDao.get(name);
	}

	@Override
	public List<Catalog> getAll() {
		return categoryDao.getAll();
	}
	
	
	public List<Catalog> getCateByProduct(int id) {
		return categoryDao.getCateByProduct(id);
	}

}