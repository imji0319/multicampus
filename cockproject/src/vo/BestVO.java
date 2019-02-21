package vo;

public class BestVO {
	
	int num;        
	String name;   
	double count;
	String alcohol;
	
	public BestVO(int num, String name, double count, String alcohol) {
		this.num = num;
		this.name = name;
		this.count = count;
		this.alcohol = alcohol;
	}
	@Override
	public String toString() {

		return num+"="+name+"="+count+"="+alcohol;
	}   
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = count;
	}

	public String getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}

	
}