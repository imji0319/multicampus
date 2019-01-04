package chap7;

final class Math{
	final public int abs(int data) {
		//data의 절대값 리턴
		if (data<0) {
			return data*(-1);
		}
		else return data; 	
	}	
}

class MyMath /*extends Math */{
	
	//상속이 불가능한 클래스를 사용하고 싶을 때 객체생성하여 활용
	public int abs(int data) {
		Math m = new Math();
		return m.abs(data);
	}

	void power() {
		System.out.println("제곱을 구합니다.");
	}
}

public class MathTest {

	public static void main(String[] args) {
		MyMath m = new MyMath();
		m.power();
		System.out.println(m.abs(10));
		System.out.println(m.abs(-10));

	}

}
