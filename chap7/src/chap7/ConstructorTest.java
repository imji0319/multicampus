package chap7;

class C1 /*extends Object*/{
	int i ;
	
	C1(String s){
		//super();
		System.out.println("C1생성자호출");
		i = 10*10;
	}
}

class C2 extends C1{
	int j;

	C2(){
		super("aaa"); //C1의 생성자가 매개변수 s를 필요로 함 
		System.out.println("C2생성자호출");
		j = 10 * 10 * 10;
	}

}

public class ConstructorTest {

	public static void main(String[] args) {
		C2 c = new C2();
		System.out.println(c.j);  // 1000
		System.out.println(c.i);  // 100 -> 상위 객체도 생성, 상위생성자호출

	}

}
