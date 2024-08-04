package iuh.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.swing.ListCellRenderer;

import iuh.edu.entity.Catalog;
import iuh.edu.jdbc.connectDB;

public class CategoryDaoImpl implements CategoryDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public void insert(Catalog category) {
		String sql = "INSERT INTO catalog(name,parent_id) VALUES (?, ?)";
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
			ps.setString(1, category.getName());
			ps.setString(2, category.getParent_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Catalog category) {
		String sql = "UPDATE catalog SET name = ?, parent_id = ? WHERE id = ?";
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
			ps.setString(1, category.getName());
			ps.setString(2, category.getParent_id());
			ps.setString(3, category.getId());
			ps.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	@Override
	public Catalog get(int id) {
		String sql = "SELECT * FROM catalog WHERE id = ? ";
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
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Catalog category = new Catalog();

				category.setId(rs.getString("id"));
				category.setName(rs.getString("name"));
				category.setParent_id(rs.getString("parent_id"));

				return category;

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Catalog get(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Catalog> getAll() {
		List<Catalog> categories = new ArrayList<Catalog>();
		String sql = "SELECT * FROM catalog";
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
				Catalog category = new Catalog();

				category.setId(rs.getString("id"));
				category.setName(rs.getString("name"));
				category.setParent_id(rs.getString("parent_id"));
				categories.add(category);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return categories;
	}

	public List<Catalog> getAllCatalog() {

		List<Catalog> listC = new ArrayList();
		String sql = "select * from catalog";
		try {
			con = new connectDB().getConnect();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				listC.add(new Catalog(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return listC;

	}
	
	public static void main(String[] args) {
		CategoryDaoImpl dao = new CategoryDaoImpl();
		List<Catalog> list = dao.getAllCatalog();
		for (Catalog o : list) {
			System.out.println(o);
		}
	}

	@Override
	public void delete(String id) {
		System.out.println("Id :" + id);
		String sql = "DELETE FROM catalog WHERE id = ?";
		new connectDB();
		Connection conn = null;
		try {
			conn = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Catalog> getCateByProduct(int id) {
		List<Catalog> products_cate = new ArrayList<Catalog>();
		String sql = "select catalog.name from catalog,product where catalog.id = product.catalog_id and product.id = ?";
		Connection conn = null;
		try {
			conn = connectDB.getConnect();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Catalog catagory_product = new Catalog();
				catagory_product.setName(rs.getString("name"));
				products_cate.add(catagory_product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products_cate;
	}
}
