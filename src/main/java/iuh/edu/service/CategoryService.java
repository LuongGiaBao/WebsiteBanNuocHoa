package iuh.edu.service;



import java.util.List;

import iuh.edu.entity.Catalog;
public interface CategoryService {
	void insert(Catalog category);

	void edit(Catalog category);

	Catalog get(int id);
	
	Catalog get(String name);

	List<Catalog> getAll();

	void delete(String id);
	
	List<Catalog> getCateByProduct(int id);

}

