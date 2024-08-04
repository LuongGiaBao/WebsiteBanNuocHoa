package iuh.edu.dao;

import java.util.List;

import iuh.edu.entity.Transactions;



public interface TransactionDao {

	void insert(Transactions transaction); 
	 
	void edit(Transactions admin); 
	
	void delete(String id); 
 
	Transactions get(int id); 
	 
	Transactions get(String name); 
 
	List<Transactions> getAll(); 

}
