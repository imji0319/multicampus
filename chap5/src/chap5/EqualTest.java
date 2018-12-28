package chap5;

public class EqualTest {

	public static void main(String[] args) {
		int i = 10;
		int j = 10;
		double d = 10.0;
		
		//참조타입 변수 : "new" 키워드 사용 데이터 저장 
		//String : new 사용 , new 미사용 둘다 가능 
		//new 사용여부에 따라 메모리 상 차이가 있음 
		//-> new 키워드 를 사용하지 않을 경우 같은 값일 경우 heap 영역의 값을 공유하여 stack 상의 동일한 메모리주소를 가지게 됨
		//-> new 키워드를 사용하면 heap상에 새로운 값을 저장함
		//즉 값이 같은 변수라고 하더라도stack상에 새로운 메모리 주소를 가지게 됨 
		
		String s1 = "java";
		String s2 = "java";
		String s3 = new String("java");
		//String s4 = new String("java");
		String s4 = new String("JAVA"); //자바는 대소문자 구분

		System.out.println(i==j);   //true
		//형변환은 기본타입끼리만 가능 
		System.out.println(i==d);   //true 
		
		//동일한 heap상의 값을 가지게 되고 stack 상의 값이 같음
		System.out.println(s1==s2); //true
		
		//new 키워드로 인해 두 변수는 다른 메모리 주소를 가지게 됨 
		System.out.println(s3==s4); //false

		//문자열의 내용을 비교하고 싶을 때 S.equals() 메소드를 활용
		System.out.println(s1.equals(s2)); //true
		System.out.println(s3.equals(s4)); //true 대문자일때 false
		
		//대소문자 구분하지 않을 때 S.equlasIgnoreCase
		System.out.println(s3.equalsIgnoreCase(s4)); //true 
		
		String s=null; //stack영역에 변수는 저장했으나 heap영역의 값을 가지지않음.즉 메모리주소가 없음
		
		//오류 : NullPointerException - s 라는 변수가 나타내는 문자열이 없기 때문에 비교 불가 
		System.out.println(s.equals(s1)); 
		
		
		s1= null;
		s2= null;
		s3= null;
		s4= null;
		//변수에 null를 대입할 경우 heap 상에서 사용하지 않은 메모리 정리를 할 수 있도록 하는 하는 과정 
		//단 stack상의 변수를 제거하지는 않음.
		
		
	}

}
