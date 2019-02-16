package vo;

public class BestVO {
	
	int num;        
	String name;   
	int count;
	int rank;
	
	public BestVO(int num, String name, int count, int rank) {
		this.num = num;
		this.name = name;
		this.count = count;
		this.rank = rank;
	}
	@Override
	public String toString() {

		return num+"="+name+"="+count+"="+rank ;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}

	
}
