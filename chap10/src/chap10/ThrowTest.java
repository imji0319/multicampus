package chap10;

class Test{
	void ma(int i) throws ArithmeticException{
		System.out.println(100/i);
	}
	
	//해당 메소드에 예외처리를 할 필요가 없음 : throws 예외
	//다른 메소드에서 예외처리할때 throws 사용
	//발생 가능한 예외에 대해 처리 방법이 다르게 정의하고자 할때 Throws 를 활용
	
	void mb() throws ArithmeticException{
		ma(0);
	}
	
	void mc() {
		try {
		ma(0);
		}
		catch(ArithmeticException e) {
			ma(100);
		}
	}
	
}


public class ThrowTest {
	public static void main(String[] args) 
			throws ArithmeticException{
		// 예외처리를 시스템에 맞기는 결과, 
		Test t = new Test();
		try {
			t.mc();
		}
		catch(ArithmeticException e) {
			System.out.println("0나누기 불가");
		}
	}
}
