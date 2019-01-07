package generic;

import java.util.ArrayList;

class Emp{
	int id; //사번
	String name; //이름
	double pay; //급여
	
	public Emp(int id, String name, double pay) {
		
		this.id = id;
		this.name = name;
		this.pay = pay;
	}

	@Override
	public String toString() {
		return id + "-"+name+"-"+pay;
	}

}

public class ArrayListTest2 {
public static void main(String[] args) {
	
	// Emp 타입 데이터만 저장, 객체들 개수 변동 많음 
	// ArrayList : 1> 여러 종류 객체 저장 2> 1가지 타입 객체저장 용도
	// ArrayList<객체>
	ArrayList<Emp> list = new ArrayList<Emp> (5);

	Emp e1 = new Emp(100,"홍길동",67000.99);
	Emp e2 = new Emp(200,"이길동",68200.5);
	Emp e3 = new Emp(300,"김길동",75000.56);
	
	list.add(e1);
	list.add(e2);
	list.add(e3);

	System.out.println(list.size());
	
	for (int i=0; i<list.size();i++) {
		System.out.println(list.get(i));
		
		//Emp 객체에서 필드변수 적용
		System.out.println(list.get(i).name);
		
	}
	



}
}
