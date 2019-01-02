package chap6;


//메소드 overloading 
class B{
	int add(int i, int j) {
		return i+j; //정수 덧셈
	}
	
	String add(String i, String j) {
		return i+j; //문자열 결합
	}
	
	double add(double i, double j) {
		return i+j; //실수 덧셈
	}

}
public class OverloadingTest {

	public static void main(String[] args) {
		
		//사용자 오버로딩 
		B b1 = new B();
		
		double r1=b1.add(1.1,2.2);
		String r2=b1.add("java","jsp");
		int r3=b1.add(11,22);
		double r4 = b1.add(100, 200.22); //자동형변환 가능 
		
		//메소드 이름이 같다 =기능이 같다 
		//매개변수 다르다 = 다양하게 사용 가능  
		
		System.out.println(r1+"\t"+r2+"\t"+r3+"\t"+r4);
		
		//라이브러리 = api 오버로딩 구현
		
		int dec = Integer.parseInt("100");
		System.out.println(dec); //100
		
		int bin = Integer.parseInt("100",2);  //2진수인 100
		System.out.println(bin); //4

	}

}
