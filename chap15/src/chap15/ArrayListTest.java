package chap15;

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

public class ArrayListTest {
public static void main(String[] args) {
	
	ArrayList list = new ArrayList(5);
	
	list.add("java");
	list.add(100);
	list.add(3.14);
	list.add(1,"sql"); //index 1에 중간 추가됨
	
	Emp e1 = new Emp(100,"홍길동",67000.99);
	Emp e2 = new Emp(200,"이길동",68200.5);
	Emp e3 = new Emp(300,"김길동",75000.56);
	
	list.add(e1);
	//자동 5개 증가 
	list.add(e2);
	list.add(e3);
	
	list.remove(1); //해당 인덱스 값 삭제
	list.set(1, "new String"); //1번의 인덱스 값 변경
	
	boolean exists = list.contains("java"); //포함여부
	System.out.println(exists);
	
	boolean exists2 = list.contains(new Emp(100,"홍길동",67000.99));  //새로운 객체를 생성하여 물어보는 것
	System.out.println(exists2); // -> false
	
	boolean exists3= list.contains(e1); //객체 포함여부
	System.out.println(exists3); // -> true
	
	
	int index = list.indexOf("java1");      //해당 값의 인덱스 리턴 -> 포함여부 확인 가능
	System.out.println(index);
	
	System.out.println(list.size());
	
	for (int i=0; i<list.size();i++) {
		System.out.println(list.get(i));
		
		if (list.get(i) instanceof Emp) { //Emp 객체이면
			System.out.println(((Emp)list.get(i)).name); //list.get(i)에 Emp 타입으로 형변환
		}
	}
	
	
	// Emp 타입 데이터만 저장, 객체들 개수 변동 많음 
	// ArrayList : 1> 여러 종류 객체 저장 2> 1가지 타입 객체저장 용도


}
}
