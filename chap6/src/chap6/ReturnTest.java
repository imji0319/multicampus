package chap6;

class A{
	int ma() { //메소드 정의 = 구현 (실행 X)  - return 하는 값의 타입 
		int i = 10;
		return i*i; 
	}
	
	double mb(){
		return 3.14;
	}
	
	String mc(){
		String s="java";
		return s+s;
	}
	
	//return 결과가 없을 경우 리턴타입 : void 
	void md(int j){   
		//j*j>=100 이상이면 출력
		
		if (j*j>=100) {
		System.out.println(j*j);
		}
		else {
			return; //메소드 중단, 호출했던 곳으로 이동 : 이 경우 뒤의 실행문장을 수행하지 않음  
		}
		System.out.println("md메소드종료");
	}
}
public class ReturnTest {

	public static void main(String[] args) {
		
		//실행문자 메모리변화 출력=객체생성
		//메소드 호출
		
		A a1 = new A(); //우선 객체생성 
		
		int result = a1.ma();
		double result2 = a1.mb();
		String result3 = a1.mc();
		
		System.out.println(result);
		System.out.println(result2);
		System.out.println(result3);
		a1.md(8); //j*j에 대해 수정을 불가능 -> 읽기 전용 결관
		
		
		System.out.println("main종료");

	}

}
