package iuh.edu.entity;

public class Admin {
	 int id;
	 String username;
	 String password;
	 String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Admin(int id, String username, String password, String name) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "admin [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name + "]";
	}
	 
	 
}
