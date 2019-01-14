package vo;

public class MemberVO {
	String id;
	int password;
	String name;
	String phone;
	String email;
	String indate;
	
	
	public MemberVO(String id, int password, String name, 
			String phone, String email, String indate) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.indate = indate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", indate=" + indate;
	}
	
	
	
	
	
}
