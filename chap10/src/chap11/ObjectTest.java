package chap11;

public class ObjectTest {

	public static void main(String[] args) {
		MyObject o1 = new MyObject("청년취업");
		MyObject o2 = new MyObject("아카데미");
		MyObject o3 = new MyObject("아카데미");
		
		// 다른 클래스 출력 내용 변경 : toString 오버라이딩
		
		System.out.println(o1/*.toString*/);//주소값
		System.out.println(o2);
	
		
		//자바 동등성 비교
		// 기본 연산자 == : 기본 + 참조 - overriding 불가 
		// Object equals() 메소드  : 참조 - overriding 가능
		// 주소 비교 : 다른 부분 비교 수정 가능
		if (o1 == o2) { //false 
			System.out.println("o1==o2 비교 같다.");
		}
		
		// 1> MyObject 타입 객체 전달
		// 2> msg 변수 내용 같은지 비교
		
		if (o1.equals(o2)) { //false
			System.out.println("o1.equals(o2) 비교 같다.");
		}
		
		if (o2.equals(o3)) { //true
			System.out.println("o2.equals(o3) 비교 같다.");
		}
		
		if (o2.equals(new String("아카데미"))) { //false
			System.out.println("o2.equals(문자열) 비교 같다.");
		}
		
		
}
}

class MyObject{
	String msg;
	MyObject(String msg){
		this.msg =msg;
	}
	
	@Override
	public String toString() {
		return msg;
	}

	@Override
	
	// 1> MyObject 타입 객체 전달
	// 2> msg 변수 내용 같은지 비교
	//o1.equals(new MyObject("A"))
	//o1.equals(new String ("A"))
	// --> 모든 클래스 Object를 최상위 클래스로 가지기 때문에 가능 
	
	public boolean equals(Object obj) {
		if (obj instanceof MyObject) {
			boolean result = msg.equals(((MyObject)obj).msg);
				return result;
		}
		else {
			return false;
		}
	}
	
}
