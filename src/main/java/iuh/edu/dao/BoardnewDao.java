package iuh.edu.dao;

import java.util.List;

import iuh.edu.entity.Boardnew;



public interface BoardnewDao {
	void insert(Boardnew boardnew) ;

	void edit(Boardnew boardnew);

	void delete(int id);

	Boardnew get(int id);
	
	Boardnew get(String name);

	List<Boardnew> getAll();
}
