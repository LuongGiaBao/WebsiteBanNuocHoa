package iuh.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import iuh.edu.entity.Admin;
import iuh.edu.jdbc.connectDB;



public class AdminDaoImpl implements AdminDao {
	@Override 
	public void insert(Admin admin) { 
		String sql = "INSERT INTO admin(username,password,name) VALUES (?,?,?)"; 
		new connectDB(); 
		Connection con = null;
		try {
			con = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
 
		try { 
			PreparedStatement ps = con.prepareStatement(sql); 
			ps.setString(1, admin.getUsername()); 
			ps.setString(2, admin.getPassword()); 
			ps.setString(3, admin.getName()); 
			ps.executeUpdate(); 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} 
	} 
 	
	@Override 
	public void delete(String id) { 		
		String sql = "Delete from admin where id=?";
		new connectDB();
		Connection con = null;
		try {
			con = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,id);
			ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	} 
	
	@Override
	public Admin get(int id) {		
		Admin admin = new Admin();
		String sql = "SELECT * FROM admin WHERE id=?";
		new connectDB();
		Connection con = null;
		try {
			con = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {				
				admin.setId(rs.getInt("id"));
				admin.setUsername(rs.getString("username"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));

				return admin;

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override 
	public void edit(Admin admin) { 
	String sql = "Update admin set username =?, password =?, name =? where id=?";

		new connectDB();
		Connection con = null;
		try {
			con = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try 
		{
			PreparedStatement ps = con.prepareStatement(sql); 
			ps.setInt(4, admin.getId());
			ps.setString(1, admin.getUsername());
			ps.setString(2, admin.getPassword());
			ps.setString(3, admin.getName());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		 
	} 
	
	@Override 
	public Admin get(String name) { 
		return null; 
	} 
 
	@Override 
	public List<Admin> getAll() { 
		List<Admin> admins = new ArrayList<Admin>(); 
		String sql = "SELECT * FROM admin"; 
		Connection conn = null;
		try {
			conn = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
 
		try { 
			PreparedStatement ps = conn.prepareStatement(sql); 
			ResultSet rs = ps.executeQuery(); 
 
			while (rs.next()) { 
				Admin admin = new Admin(); 
 
				admin.setId(rs.getInt("id")); 
				admin.setUsername(rs.getString("username")); 
				admin.setPassword(rs.getString("password")); 
				admin.setName(rs.getString("name")); 
				admins.add(admin); 
			} 
 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} 
 
		return admins; 
	}
	

}
