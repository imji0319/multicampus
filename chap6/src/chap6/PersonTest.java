package chap6;

class Person {
	String name;
	int age;
	static String nation ="대한민국"; //static : 1개 값을 모든 객체가 똑같이 공유 -> 미리 정적 선언 
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	
	
}

public class PersonTest {

	public static void main(String[] args) {
		
		System.out.println(Person.nation); //타 클래스 내 static 변수를 지칭하는 방법

		
		Person p1 = new Person("홍길동",29);
		System.out.println
		("p1의 객체 이름은 " + p1.name+"이고 나이는 "+p1.age+"이며 국적은 " +Person.nation+"입니다.");
		
		Person p2 = new Person("박보검",24);
		System.out.println
		("p2의 객체 이름은 " + p2.name+"이고 나이는 "+p2.age+"이며 국적은 " +Person.nation+"입니다.");
		
		//api의 static인 메소드
		Math.random();
		Integer.parseInt("100");
		
		//static 변수 예 : 원주율 : 3.14
		System.out.println(Math.PI); 
		System.out.println(Integer.MAX_VALUE); //정수int 최대값 2^31-1

	}

}
