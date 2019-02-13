package vo;

public class MemberVO {
	String name;
	String phone;
	
	public MemberVO(){
		
	}
	
	
	public MemberVO(String name, String phone) {
		super();
		this.name = name;
		this.phone = phone;
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
	
	
}
