package iuh.edu.serviceImpl; 
 
import java.util.List;

import iuh.edu.dao.AdminDaoImpl;
import iuh.edu.entity.Admin;
import iuh.edu.service.AdminService;


 
public class AdminServicesImpl<AdminDao> implements AdminService { 
	AdminDao adminDao = (AdminDao) new AdminDaoImpl(); 
	 
	@Override 
	public void insert(Admin admin) { 
		((AdminDaoImpl) adminDao).insert(admin); 
	} 
 
	@Override
	public void edit(Admin admin) {
		Admin oldAdmin = ((AdminDaoImpl) adminDao).get(admin.getId());		
		oldAdmin.setUsername(admin.getUsername());
		oldAdmin.setPassword(admin.getPassword());
		oldAdmin.setName(admin.getName());
		((AdminDaoImpl) adminDao).edit(oldAdmin); 

	} 
 
	@Override 
	public void delete(String id) { 
		((AdminDaoImpl) adminDao).delete(id); 
 
	} 
 
	@Override 
	public Admin get(int id) { 
		return ((AdminDaoImpl) adminDao).get(id); 
	} 
 
	@Override 
	public Admin get(String name) { 
		return ((AdminDaoImpl) adminDao).get(name); 
	} 
 
	@Override 
	public List<Admin> getAll() { 
		return ((AdminDaoImpl) adminDao).getAll(); 
	}	
	
} 
 
