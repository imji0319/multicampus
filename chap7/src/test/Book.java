package test;

public class Book {
	private String title;
	private int price;
	
	Book(String title, int price){
		this.title = title;
		this.price = price;
	}
	
	Book(){}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	

}
